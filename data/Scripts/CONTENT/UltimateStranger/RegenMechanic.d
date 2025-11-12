//************************************************
// Repurpose vanilla regeneration mechanic to use attribute for heal amount per static frequency
// https://forum.worldofplayers.de/forum/threads/1578433-Performant-damage-over-time
//************************************************


func int Npc_GetHitpointRegenRate(var c_npc slf) {
    return Npc_GetTalentValue(slf, NPC_TALENT_REGENERATE) + 100;
};
func int Npc_GetManaRegenRate(var c_npc slf) {
    return Npc_GetTalentValue(slf, NPC_TALENT_FIREMASTER) + 100;
};

func void Npc_SetHitpointRegenRate(var c_npc slf, var int speed) {
    Npc_SetTalentValue(slf, NPC_TALENT_REGENERATE, speed);
};
func void Npc_SetManaRegenRate(var c_npc slf, var int speed) {
    Npc_SetTalentValue(slf, NPC_TALENT_FIREMASTER, speed);
};

/** Add (or remove) hitpoint regen. */
func void B_AddHitpointRegen(var c_npc slf, var int amount, var int unlimited) {
    if (slf.attribute[ATR_HITPOINTS] <= 0) {
        return; // no revives
    };
    const int newRegen = slf.attribute[ATR_REGENERATEHP] + amount;
    if (newRegen < 0) {
        slf.attribute[ATR_REGENERATEHP] = 0;
    } else if (unlimited == FALSE) && (slf.attribute[ATR_HITPOINTS] + newRegen > slf.attribute[ATR_HITPOINTS_MAX]) {
        slf.attribute[ATR_REGENERATEHP] = slf.attribute[ATR_HITPOINTS_MAX] - slf.attribute[ATR_HITPOINTS];
    } else {
        slf.attribute[ATR_REGENERATEHP] += amount;
    };
};

/** Add (or remove) mana regen. */
func void B_AddManaRegen(var c_npc slf, var int amount, var int unlimited) {
    const int newRegen = slf.attribute[ATR_REGENERATEMANA] + amount;
    if (newRegen < 0) {
        slf.attribute[ATR_REGENERATEMANA] = 0;
    } else if (unlimited == FALSE) && (slf.attribute[ATR_MANA] + newRegen > slf.attribute[ATR_MANA_MAX]) {
        slf.attribute[ATR_REGENERATEMANA] = slf.attribute[ATR_MANA_MAX] - slf.attribute[ATR_MANA];
    } else {
        slf.attribute[ATR_REGENERATEMANA] += amount;
    };
};

// func void hellohello() {
//     var oCNpc her; her = Hlp_GetNpc(hero);
//     Print(IntToString(her.attribute[ATR_REGENERATEHP]));
// };

func void RegenMechanic_Init() {
    //HookEngineF(7610439, 6, hellohello); // regen
    //HookEngineF(7558968, 6, hellohello); // burn

    // Helpers, reused multiple times
    var int address;
    var int r;

    // ------------------------------------------------------------------------------
    // Fix: mana regen triggers if ATR_REGENERATEMANA != 0 (instead of ATR_REGENERATEHP)
    MemoryProtectionOverride(7610451, 1);
    MEM_WriteByte(7610451 /* 0x742053 */, 212 /* 0xd4 */); // [esi+1D0h] -> [esi+1D4h]

    // ------------------------------------------------------------------------------
    // Remove resetting of regen timers on taking damage (not needed)
    const int oCNpc__OnDamage_Hit__ResetTimers_Start = 6737613; // 0x66CECD
    const int oCNpc__OnDamage_Hit__ResetTimers_End   = 6737686; // 0x66CF16

    // Fill with NOPs
    repeat(r, oCNpc__OnDamage_Hit__ResetTimers_End - oCNpc__OnDamage_Hit__ResetTimers_Start);
        address = oCNpc__OnDamage_Hit__ResetTimers_Start + r;
        // there is unrelated mov and pop's in the middle, leave them untouched
        if (address < 6737657 /* 0x66CEF9 */ || address >= 6737664 /* 0x66CF00*/)
        && (address < 6737678 /* 0x66CF0E */ || address >= 6737680 /* 0x66CF10*/) {
            MEM_WriteByte(address, 144); // NOP | 0x90
        };
    end;

    // ------------------------------------------------------------------------------
    // Remove regen skip on full HP/mana (so regen is not delayed)
    const int oCNpc__Regenerate__Life_SkipWhenFull_Start = 7610402; // 0x742022
    const int oCNpc__Regenerate__Life_SkipWhenFull_End = 7610416;   // 0x742030
    const int oCNpc__Regenerate__Mana_SkipWhenFull_Start = 7610478; // 0x74206E
    const int oCNpc__Regenerate__Mana_SkipWhenFull_End = 7610492;   // 0x74207C

    // Fill with NOPs
    repeat(r, oCNpc__Regenerate__Life_SkipWhenFull_End - oCNpc__Regenerate__Life_SkipWhenFull_Start);
        address = oCNpc__Regenerate__Life_SkipWhenFull_Start + r;
        MEM_WriteByte(address, 144); // NOP | 0x90
    end;


    // Fill with NOPs
    repeat(r, oCNpc__Regenerate__Mana_SkipWhenFull_End - oCNpc__Regenerate__Mana_SkipWhenFull_Start);
        address = oCNpc__Regenerate__Mana_SkipWhenFull_Start + r;
        MEM_WriteByte(address, 144); // NOP | 0x90
    end;

    // ------------------------------------------------------------------------------
    // OLD: msPerRegen = 1000 * atr_regen
    /* NEW: msPerRegen = 1000 / (atr_max * regen_base_per_hp * regen_multiplier)
        regen_base_per_hp = 1/60
        regen_multiplier = (talent + 100) / 100 [minimum 0.2]
        ==>
        msPerRegen = 6000000/(atr_max*(talent+100))
    */
    const int oCNpc__Regenerate__Life_SetTimer_Start = 7610427; // 0x74203B
    const int oCNpc__Regenerate__Mana_SetTimer_Start = 7610503; // 0x742087

    address = oCNpc__Regenerate__Life_SetTimer_Start;
    ASM_Open(76); // 69 + retn(6) + 1
    // ----- Add jump from engine function to new code -----
        // replace old fild with jump
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

        // remove old fmul
        MEM_WriteByte(address + 6, ASMINT_OP_nop);
        MEM_WriteByte(address + 7, ASMINT_OP_nop);
        MEM_WriteByte(address + 8, ASMINT_OP_nop);
        MEM_WriteByte(address + 9, ASMINT_OP_nop);
        MEM_WriteByte(address + 10, ASMINT_OP_nop);
        MEM_WriteByte(address + 11, ASMINT_OP_nop);

    // EDX: talent (fallback to zero)
    /*  mov edx, esi+TALENTS_ARRAY_OFFSET
        0x8b        0x96        0x0568 */
        ASM_1(139); ASM_1(150); ASM_4(1384);
    /*  mov edx, edx+TALENT_INDEX_OFFSET
        0x8b        0x92        4*NPC_TALENT_REGENERATE */
        ASM_1(139); ASM_1(146); ASM_4(4*NPC_TALENT_REGENERATE);
    /*  cmp edx, 0
        0x83        0xfa        0x00 */
        ASM_1(131); ASM_1(250); ASM_1(0);
    /*  jz .set_fallback
        0x74        0x08 */
        ASM_1(116); ASM_1(8);
    /*  mov edx, edx+TALENT_VALUE_OFFSET
        0x8b        0x92        44 */
        ASM_1(139); ASM_1(146); ASM_4(44);
    /*  jmp .skip_fallback
        0xeb        0x05 */
        ASM_1(235); ASM_1(5);
        // .set_fallback
    /*  mov edx, 0
        0xba    0x00 */
        ASM_1(186); ASM_4(0);
        // .skip_fallback

    // EDX: talent+100
    /*  add edx, 100
        0x83        0xc2        100 */
        ASM_1(131); ASM_1(194); ASM_1(100);

    // EDX: apply minimum 20 (to avoid making regen stuck)
    /*  cmp edx, 20
        0x83        0xfa        20 */
        ASM_1(131); ASM_1(250); ASM_1(20);
    /*  jge .skip_min
        0x7d        0x05 */
        ASM_1(125); ASM_1(5);
    /*  mov edx, 20
        0xba        20 */
        ASM_1(186); ASM_4(20);
        // .skip_min

    // EDX: (talent+100)*max_hp
    /*  imul edx, esi+ATTRIBUTES_ARRAY_OFFSET+ATR_HITPOINTS_MAX_OFFSET
        0x0f        0xaf        0x96        1B8h+4*ATR_HITPOINTS_MAX */
        ASM_1(15);  ASM_1(175); ASM_1(150); ASM_4(440+4*ATR_HITPOINTS_MAX);

    // FPU: 6000000/((talent+100)*max_hp)
    /*  push 6000000
        0x68        0x5b8d80 */
        ASM_1(104); ASM_4(6000000);
    /*  fild dword ptr [esp+0]
        0xdb        0x44       0x24       0x00 */
        ASM_1(219); ASM_1(68); ASM_1(36); ASM_1(0);
    /*  push edx
        0x52 */
        ASM_1(82);
    /*  fild dword ptr [esp+0]
        0xdb        0x44       0x24       0x00 */
        ASM_1(219); ASM_1(68); ASM_1(36); ASM_1(0);
    /*  add esp, 8
        0x83        0xc4        0x08 */
        ASM_1(131); ASM_1(196); ASM_1(8);
    /*  fdivp st(1), st(0)
        0xde        0xf9 */
        ASM_1(222); ASM_1(249);

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();

    address = oCNpc__Regenerate__Mana_SetTimer_Start;
    ASM_Open(76); // 69 + retn(6) + 1
    // ----- Add jump from engine function to new code -----
        // replace old fild with jump
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

        // remove old fmul
        MEM_WriteByte(address + 6, ASMINT_OP_nop);
        MEM_WriteByte(address + 7, ASMINT_OP_nop);
        MEM_WriteByte(address + 8, ASMINT_OP_nop);
        MEM_WriteByte(address + 9, ASMINT_OP_nop);
        MEM_WriteByte(address + 10, ASMINT_OP_nop);
        MEM_WriteByte(address + 11, ASMINT_OP_nop);

    // EDX: talent (fallback to zero)
    /*  mov edx, esi+TALENTS_ARRAY_OFFSET
        0x8b        0x96        0x0568 */
        ASM_1(139); ASM_1(150); ASM_4(1384);
    /*  mov edx, edx+TALENT_INDEX_OFFSET
        0x8b        0x92        4*NPC_TALENT_FIREMASTER */
        ASM_1(139); ASM_1(146); ASM_4(4*NPC_TALENT_FIREMASTER);
    /*  cmp edx, 0
        0x83        0xfa        0x00 */
        ASM_1(131); ASM_1(250); ASM_1(0);
    /*  jz .set_fallback
        0x74        0x08 */
        ASM_1(116); ASM_1(8);
    /*  mov edx, edx+TALENT_VALUE_OFFSET
        0x8b        0x92        44 */
        ASM_1(139); ASM_1(146); ASM_4(44);
    /*  jmp .skip_fallback
        0xeb        0x05 */
        ASM_1(235); ASM_1(5);
        // .set_fallback
    /*  mov edx, 0
        0xba    0x00 */
        ASM_1(186); ASM_4(0);
        // .skip_fallback

    // EDX: talent+100
    /*  add edx, 100
        0x83        0xc2        100 */
        ASM_1(131); ASM_1(194); ASM_1(100);

    // EDX: apply minimum 20 (to avoid making regen stuck)
    /*  cmp edx, 20
        0x83        0xfa        20 */
        ASM_1(131); ASM_1(250); ASM_1(20);
    /*  jge .skip_min
        0x7d        0x05 */
        ASM_1(125); ASM_1(5);
    /*  mov edx, 20
        0xba        20 */
        ASM_1(186); ASM_4(20);
        // .skip_min

    // EDX: (talent+100)*atr_max
    /*  imul edx, esi+ATTRIBUTES_ARRAY_OFFSET+ATR_MANA_MAX_OFFSET
        0x0f        0xaf        0x96        1B8h+4*ATR_MANA_MAX */
        ASM_1(15);  ASM_1(175); ASM_1(150); ASM_4(440+4*ATR_MANA_MAX);

    // FPU: 6000000/((talent+100)*atr_max)
    /*  push 6000000
        0x68        0x5b8d80 */
        ASM_1(104); ASM_4(6000000);
    /*  fild dword ptr [esp+0]
        0xdb        0x44       0x24       0x00 */
        ASM_1(219); ASM_1(68); ASM_1(36); ASM_1(0);
    /*  push edx
        0x52 */
        ASM_1(82);
    /*  fild dword ptr [esp+0]
        0xdb        0x44       0x24       0x00 */
        ASM_1(219); ASM_1(68); ASM_1(36); ASM_1(0);
    /*  add esp, 8
        0x83        0xc4        0x08 */
        ASM_1(131); ASM_1(196); ASM_1(8);
    /*  fdivp st(1), st(0)
        0xde        0xf9 */
        ASM_1(222); ASM_1(249);

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();

    // ------------------------------------------------------------------------------
    // Make regen decrement ATR_REGENERATE_X as it increases ATR_X
    const int oCNpc__ChangeAttribute = 7536480; // 0x72FF60
    const int oCNpc__Regenerate__Life_CallChangeAttribute_Start = 7610416; // 0x742030
    const int oCNpc__Regenerate__Mana_CallChangeAttribute_Start = 7610492; // 0x74207C

    address = oCNpc__Regenerate__Life_CallChangeAttribute_Start;
    ASM_Open(24); // 19 + retn(6) + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    // Add to main attribute
    /*  push 1
        0x6a        0x01 */
        ASM_1(106); ASM_1(1);
    /*  push ATR_HITPOINTS
        0x6a        ATR_HITPOINTS */
        ASM_1(106); ASM_1(ATR_HITPOINTS);
    /*  mov ecx, esi
        0x8b        0xce */
        ASM_1(139); ASM_1(206);
    /*  call    ?ChangeAttribute@oCNpc@@QAEXHH@Z */
        ASM_1(ASMINT_OP_call);  ASM_4(oCNpc__ChangeAttribute - ASM_Here() - 4);

    // Reduce from regen attribute
    /*  push -1
        0x6a        0xFF */
        ASM_1(106); ASM_1(255);
    /*  push ATR_REGENERATEHP
        0x6a        ATR_REGENERATEHP */
        ASM_1(106); ASM_1(ATR_REGENERATEHP);
    /*  mov ecx, esi
        0x8b        0xce */
        ASM_1(139); ASM_1(206);
    /*  ChangeAttribute call is in the original code after return. */

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();

    address = oCNpc__Regenerate__Mana_CallChangeAttribute_Start;
    ASM_Open(24); // 19 + retn(6) + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    // Add to main attribute
    /*  push 1
        0x6a        0x01 */
        ASM_1(106); ASM_1(1);
    /*  push ATR_MANA
        0x6a        ATR_MANA */
        ASM_1(106); ASM_1(ATR_MANA);
    /*  mov ecx, esi
        0x8b        0xce */
        ASM_1(139); ASM_1(206);
    /*  call    ?ChangeAttribute@oCNpc@@QAEXHH@Z */
        ASM_1(ASMINT_OP_call);  ASM_4(oCNpc__ChangeAttribute - ASM_Here() - 4);

    // Reduce from regen attribute
    /*  push -1
        0x6a        0xFF */
        ASM_1(106); ASM_1(255);
    /*  push ATR_REGENERATEMANA
        0x6a        ATR_REGENERATEMANA */
        ASM_1(106); ASM_1(ATR_REGENERATEMANA);
    /*  mov ecx, esi
        0x8b        0xce */
        ASM_1(139); ASM_1(206);
    /*  ChangeAttribute call is in the original code after return. */

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();
};
