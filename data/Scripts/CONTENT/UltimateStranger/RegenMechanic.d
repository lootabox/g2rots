const float regenFrequencyMs = 100.0;

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

    //HookEngineF(7610439, 6, hellohello);

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
    // Make timer for regen static and independent of the attribute
    address = MEM_GetFloatAddress(regenFrequencyMs);
    const int oCNpc__Regenerate__Life_SetTimer_Start = 7610427; // 0x74203B
    const int oCNpc__Regenerate__Mana_SetTimer_Start = 7610503; // 0x742087

    // LIFE: fild dword *[esi+1D0h] -> fldz
    // LIFE: fmul ds:__real@447a0000 -> fadd dword *regenFrequencyMs
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 0, 217);     // fldz | 0xd9
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 1, 238);     // fldz | 0xee
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 2, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 3, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 4, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 5, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 6, 216);     // fadd | 0xd8
    MEM_WriteByte(oCNpc__Regenerate__Life_SetTimer_Start + 7,   5);     // fadd | 0x05
    MEM_WriteInt (oCNpc__Regenerate__Life_SetTimer_Start + 8, address); // *regenFrequencyMs

    // MANA: fild dword *[esi+1D4h] -> fldz
    // MANA: fmul ds:__real@447a0000 -> fadd dword *regenFrequencyMs
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 0, 217);     // fldz | 0xd9
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 1, 238);     // fldz | 0xee
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 2, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 3, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 4, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 5, 144);     // nop | 0x90
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 6, 216);     // fadd | 0xd8
    MEM_WriteByte(oCNpc__Regenerate__Mana_SetTimer_Start + 7,   5);     // fadd | 0x05
    MEM_WriteInt (oCNpc__Regenerate__Mana_SetTimer_Start + 8, address); // *regenFrequencyMs

    // ------------------------------------------------------------------------------
    // Make regen decrement ATR_REGENERATE_X as it increases ATR_X
    const int oCNpc__ChangeAttribute = 7536480; // 0x72FF60
    const int oCNpc__Regenerate__Life_CallChangeAttribute_Start = 7610416; // 0x742030
    const int oCNpc__Regenerate__Mana_CallChangeAttribute_Start = 7610492; // 0x74207C

    // For life
    address = oCNpc__Regenerate__Life_CallChangeAttribute_Start;
    ASM_Open(24); // 17 + retn + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    /*  push -1
        0x6a        0x00    */
        ASM_1(106); ASM_1(-1);
    /*  push ATR_REGENERATEHP
        0x6a        0x00    */
        ASM_1(106); ASM_1(ATR_REGENERATEHP);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);
    /*  call    ?ChangeAttribute@oCNpc@@QAEXHH@Z    */
        ASM_1(ASMINT_OP_call);  ASM_4(oCNpc__ChangeAttribute - ASM_Here() - 4);

    /*  push 1
        0x6a        0x00    */
        ASM_1(106); ASM_1(1);
    /*  push ATR_HITPOINTS
        0x6a        0x00    */
        ASM_1(106); ASM_1(ATR_HITPOINTS);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);
    /*  ChangeAttribute call is in the original code after return.  */

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();

    // For mana
    address = oCNpc__Regenerate__Mana_CallChangeAttribute_Start;
    ASM_Open(24); // 17 + retn + 1
    // ----- Add jump from engine function to new code -----
        MEM_WriteByte(address + 0, ASMINT_OP_jmp);
        MEM_WriteInt (address + 1, ASMINT_CurrRun-address-5); // relative address
        MEM_WriteByte(address + 5, ASMINT_OP_nop);

    /*  push -1
        0x6a        0x00    */
        ASM_1(106); ASM_1(-1);
    /*  push ATR_REGENERATEMANA
        0x6a        0x00    */
        ASM_1(106); ASM_1(ATR_REGENERATEMANA);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);
    /*  call    ?ChangeAttribute@oCNpc@@QAEXHH@Z    */
        ASM_1(ASMINT_OP_call);  ASM_4(oCNpc__ChangeAttribute - ASM_Here() - 4);

    /*  push 1
        0x6a        0x00    */
        ASM_1(106); ASM_1(1);
    /*  push ATR_MANA
        0x6a        0x00    */
        ASM_1(106); ASM_1(ATR_MANA);
    /*  mov ecx, esi
        0x8b        0xce    */
        ASM_1(139); ASM_1(206);
    /*  ChangeAttribute call is in the original code after return.  */

    // ----- Return to engine function -----
        ASM_1(ASMINT_OP_pushIm);
        ASM_4(address + 6);
        ASM_1(ASMINT_OP_retn);

    ASM_Close();
};
