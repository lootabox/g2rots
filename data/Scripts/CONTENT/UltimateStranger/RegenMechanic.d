const float regenFrequencyMs = 400.0;

//************************************************
// Repurpose vanilla regeneration mechanic to use attribute for heal amount per static frequency
// https://forum.worldofplayers.de/forum/threads/1578433-Performant-damage-over-time
//************************************************

var int avg;
func void hellohello() {
    var oCNpc her; her = Hlp_GetNpc(hero);
    printf(her.hpHeal);
    /* if (lf(her.hpHeal, castToIntf(50.0))) {
        avg = divf(addf(mulf(avg, castToIntf(49.0)), her.hpHeal), castToIntf(50.0));
        printf(avg);
    }; */
};

func void RegenMechanic_Init() {

    // HookEngineF(7610439, 6, hellohello);

    // Helper, reused multiple times
    var int address;

    // ------------------------------------------------------------------------------
    // Fix: mana regen triggers if ATR_REGENERATEMANA != 0 (instead of ATR_REGENERATEHP)
    MemoryProtectionOverride(7610451, 1);
    MEM_WriteByte(7610451 /* 0x742053 */, 212 /* 0xd4 */); // [esi+1D0h] -> [esi+1D4h]

    // ------------------------------------------------------------------------------
    // Remove resetting of regen timers on taking damage
    const int oCNpc__OnDamage_Hit__ResetTimers_Start = 6737613; // 0x66CECD
    const int oCNpc__OnDamage_Hit__ResetTimers_End   = 6737686; // 0x66CF16

    // Fill with NOPs
    repeat(r, oCNpc__OnDamage_Hit__ResetTimers_End - oCNpc__OnDamage_Hit__ResetTimers_Start); var int r;
        address = oCNpc__OnDamage_Hit__ResetTimers_Start + r;
        // there is unrelated mov and pop's in the middle, leave them untouched
        if (address < 6737657 /* 0x66CEF9 */ || address >= 6737664 /* 0x66CF00*/)
        && (address < 6737678 /* 0x66CF0E */ || address >= 6737680 /* 0x66CF10*/) {
            MEM_WriteByte(address, 144); // NOP | 0x90
        };
    end;

    // ------------------------------------------------------------------------------
    // Make timer for regen static and independent of the attribute
    const int oCNpc__Regenerate__Life_SetTimer_Start = 7610427; // 0x74203B
    const int oCNpc__Regenerate__Mana_SetTimer_Start = 7610503; // 0x742087

    // LIFE: fild dword * [esi+1D0h] -> fld dword * [esi+7C4h]
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 0, 217);     // fld | 0xd9
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 1, 134);     // fld | 0x86
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 2, 196);     // fld | 0xc4
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 3,   7);     // fld | 0x07
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 4,   0);     // fld | 0x00
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 5,   0);     // fld | 0x00

    // MANA: fild dword * [esi+1D4h] -> fld dword * [esi+7C8h]
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 0, 217);     // fld | 0xd9
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 1, 134);     // fld | 0x86
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 2, 200);     // fld | 0xc8
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 3,   7);     // fld | 0x07
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 4,   0);     // fld | 0x00
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 5,   0);     // fld | 0x00

    // fmul ds:__real@447a0000 -> fadd dword * regenFrequencyMs
    address = MEM_GetFloatAddress(regenFrequencyMs);
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 6, 216);     // fadd | 0xd8
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 7,   5);     // fadd | 0x05
    MEM_WriteInt (oCNpc__Regenerate__Life_SetTimer_Start + 8, address); // *regenFrequencyMs
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 6, 216);     // fadd | 0xd8
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 7,   5);     // fadd | 0x05
    MEM_WriteInt (oCNpc__Regenerate__Mana_SetTimer_Start + 8, address); // *regenFrequencyMs

    // ------------------------------------------------------------------------------
    // Make regen use attribute for regen amount per cycle
    const int oCNpc__Regenerate__Life_CallChangeAttribute_Start = 7610416; // 0x742030
    const int oCNpc__Regenerate__Mana_CallChangeAttribute_Start = 7610492; // 0x74207C

    // For life
    address = oCNpc__Regenerate__Life_CallChangeAttribute_Start;
    ASM_Open(17); // 10 + retn + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    /*  push dword ptr [esi+1D0h]
        0xff        0xb6        0xd0        0x01        0x00        0x00    */
        ASM_1(255); ASM_1(182); ASM_1(208); ASM_1(1);   ASM_1(0);   ASM_1(0);
    /*  push 0
        0x6a        0x00    */
        ASM_1(106); ASM_1(0);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();

    // For mana
    address = oCNpc__Regenerate__Mana_CallChangeAttribute_Start;
    ASM_Open(17); // 10 + retn + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    /*  push dword ptr [esi+1D4h]
        0xff        0xb6        0xd4        0x01        0x00        0x00    */
        ASM_1(255); ASM_1(182); ASM_1(212); ASM_1(1);   ASM_1(0);   ASM_1(0);
    /*  push 2
        0x6a        0x02    */
        ASM_1(106); ASM_1(2);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();
};
