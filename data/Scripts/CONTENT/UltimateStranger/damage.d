
// https://forum.worldofplayers.de/forum/threads/1149697-Script-Eigene-Schadensberechnung?p=26611509&viewfull=1#post26611509

func int DMG_Calculate_Minimum(var c_npc att, var c_npc vic, var int dmg) {
	// Hero has no minimum damage
	if (Npc_IsPlayer(att)) {
		if (dmg > 0)	{ return dmg; };
		return 0;
	};

	// Calculate NPC minimum damage
	var int dmgMin; dmgMin = dmg * NPC_MINIMAL_PERCENT / 100;
	if (dmgMin < NPC_MINIMAL_DAMAGE) { dmgMin = NPC_MINIMAL_DAMAGE; };

	// Check whether to use minimum damage
	if (dmgMin < dmg)	{ return dmg; };
	return dmgMin;
};

func void DMG_Apply_Fire(var c_npc att, var c_npc vic, var int fireDmg) {
	fireDmg = fireDmg - vic.protection[PROT_FIRE];
	if (fireDmg > 0) {
		dot_burn_apply(vic, fireDmg, DOT_BURN_VFX_DURATION_S, att);
	};
};

func void DMG_Apply_Venom(var c_npc att, var c_npc vic, var int venomPercent) {
	if (venomPercent > 0) {
		dot_venom_apply(vic, venomPercent, att);
	};
};

func int DMG_Check_Spell_Block(var c_npc vic, var int spellID) {
	// Only player can block spells
	if (Npc_IsPlayer(vic))
	{
		// Check for rune sword / rune power
		var c_item wpn; wpn = Npc_GetReadiedWeapon(vic);
		if (Npc_HasReadiedMeleeWeapon(vic))
		{
			if (Hlp_IsItem(wpn, ItMw_Runenschwert))
			|| (Hlp_IsItem(wpn, ItMw_Zweihaender3))
			{
				if (C_BodyStateContains(vic, BS_PARADE))
				{
					// Some spells cant be blocked
					if (spellID == SPL_BreathOfDeath)
					|| (spellID == SPL_DestroyUndead)
					|| (spellID == SPL_Earthquake)
					|| (spellID == SPL_Firerain)
					|| (spellID == SPL_Firestorm)
					|| (spellID == SPL_Geyser)
					|| (spellID == SPL_IceWave)
					|| (spellID == SPL_LightningFlash)
					|| (spellID == SPL_MassDeath)
					|| (spellID == SPL_Pyrokinesis)
					|| (spellID == SPL_Skull)
					|| (spellID == SPL_Swarm)
					|| (spellID == SPL_Thunderstorm)
					|| (spellID == SPL_WindFist)
					{
						return FALSE;
					};
					return TRUE;
				};
			};
		};
	};
	return FALSE;
};

func int DMG_Check_Lightning_Weakness(var c_npc vic) {
	if	(C_BodyStateContains(vic,BS_SWIM))
	||	(C_BodyStateContains(vic,BS_DIVE))
	||	(GetWaterLevel(vic) == WATERLEVEL_WADE)
	//||	(Wld_IsRaining() && (CurrentLevel == NEWWORLD_ZEN || CurrentLevel == OLDWORLD_ZEN || CurrentLevel == ADDONWORLD_ZEN))
	{
		return TRUE;
	} else if (Buff_Has(vic, magic_wet)) {
		return TRUE;
	};
	return FALSE;
};

func int DMG_Calculate_Melee(var c_npc att, var c_npc vic, var c_item wpn, var int bHasHit) {
	// Get base weapon damage + stat
	var int dmg; dmg = wpn.damageTotal + att.attribute[ATR_STRENGTH];
	
	// Check for weapon specials
	/* if ( 		wpn.weight == Value_Orkschlaechter_Weapon_ID && (vic.guild == GIL_ORC || vic.guild == GIL_UNDEADORC) ) {
		dmg += Value_Orkschlaechter_BonusDmg;
	} else if ( wpn.weight == Value_Blessed_2_Weapon_ID && C_NpcIsUndead(vic) ) {
		dmg += Value_Blessed_BonusDmg_2;
	} else if ( wpn.weight == Value_Blessed_3_Weapon_ID && C_NpcIsUndead(vic) ) {
		dmg += Value_Blessed_BonusDmg_3;
	} else if ( wpn.weight == Value_Special_4_Weapon_ID && (vic.guild == GIL_DRAGON || vic.guild == GIL_DRACONIAN) ) {
		dmg += Value_Special_4_BonusDmg;
	} else if ( wpn.weight == Value_WolfSword_Weapon_ID && (vic.guild == GIL_WOLF || vic.guild == GIL_SUMMONED_WOLF || vic.guild == GIL_SUMMONED_BLACK_WOLF)) {
		dmg += Value_WolfSword_BonusDmg;
	} else if ( wpn.weight == Value_Inquisitor_Weapon_ID && C_NpcIsEvil(vic) ) {
		dmg += Value_Inquisitor_BonusDmg;
	}; */

	// Get protection (when attacked with a weapon humans always use PROT_POINT / weapon protection and non-humans go according to weapon damage type)
	var int prot;
	if 		vic.guild < GIL_SEPERATOR_HUM	{ prot = vic.protection[PROT_POINT]; }
	else if wpn.damagetype == DAM_BLUNT		{ prot = vic.protection[PROT_BLUNT]; }
	else if wpn.damagetype == DAM_EDGE		{ prot = vic.protection[PROT_EDGE]; }
	else /*if wpn.damagetype == DAM_POINT*/	{ prot = vic.protection[PROT_POINT]; };

	// Check immunity
	if (prot == IMMUNE) 	{ return 0; };

	// Handle water protection
	if (C_BodyStateContains(vic, BS_SWIM)) || (C_BodyStateContains(vic, BS_DIVE)) { prot *= 2; };

var string pristr; pristr = IntToString(dmg);

	// Handle protection and minimum damage
	dmg = DMG_Calculate_Minimum(att, vic, dmg - prot);

pristr = ConcatStrings(pristr, ConcatStrings(" -> ", IntToString(dmg)));

	// Handle combo (10% + 10%/cc)
	if (Npc_IsPlayer(att))
	{
		var oCNpc oCHer; oCHer = Hlp_GetNpc(hero);
		var oCAniCtrl_Human modelState; modelState = _^(oCHer.anictrl);
		dmg = dmg * (2 + modelState.combonr) / 10; // divide by 5*2 for combo counter and crit
	} else {
		dmg = dmg / 2; // divide by 2 for crit
	};

pristr = ConcatStrings(pristr, ConcatStrings(" -> ", IntToString(dmg)));

	// Check for crit
	if (bHasHit) { dmg *= 2; }; // crit doubles damage

Print(ConcatStrings(pristr, ConcatStrings(" -> ", IntToString(dmg))));
	return dmg;
};

func int DMG_Calculate_Fist(var c_npc att, var c_npc vic) {
	var int dmg; dmg = att.attribute[ATR_STRENGTH];

	// Bloodfly / Swampdrone venom
	if (att.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY || att.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		DMG_Apply_Venom(att, vic, att.damage[DAM_INDEX_EDGE]);
	};
	// Check for fire damage
	if (att.damage[DAM_INDEX_FIRE] > 0) {
		DMG_Apply_Fire(att, vic, att.damage[DAM_INDEX_FIRE]);
		return 0;
	};

	// Get damage and protection
	var int prot;
	if		(att.damagetype & DAM_EDGE)		{ prot = vic.protection[PROT_EDGE]; }
	else if	(att.damagetype & DAM_BLUNT)	{ prot = vic.protection[PROT_BLUNT]; }
	else if	(att.damagetype & DAM_POINT)	{ prot = vic.protection[PROT_POINT]; }
	else if	(att.damagetype & DAM_MAGIC)	{ prot = vic.protection[PROT_MAGIC]; }
	else if	(att.damagetype & DAM_FIRE)		{ prot = vic.protection[PROT_FIRE]; }
	else									{ prot = vic.protection[PROT_BLUNT]; }; // failsafe

var string pristr; pristr = IntToString(dmg);

	// Handle protection and minimum damage
	dmg = DMG_Calculate_Minimum(att, vic, dmg - prot);

	return dmg;
};

func int DMG_Calculate_Magic(var c_npc att, var c_npc vic, var int spellID, var int dmg) {
var string pristr; pristr = IntToString(dmg);

	// Get protection amount
	var int prot; prot = vic.protection[PROT_MAGIC];
	if (prot == IMMUNE)	{ return 0; };

	// FIRE SPELLS ---------------------------------------------------------------------------
	if	(spellID == SPL_Firebolt)
	||	(spellID == SPL_InstantFireball)
	||	(spellID == SPL_Firestorm)
	||	(spellID == SPL_ChargeFireball)
	||	(spellID == SPL_Pyrokinesis)
	||	(spellID == SPL_Firerain)
	{
		// Burn dot is 100% with fire staff, otherwise 50%
		var int fireDot;
		if (MageStaff_Good_2H_03_Equipped) {
			fireDot = dmg;
			dmg = 0;
		} else {
			fireDot = dmg / 2;
			dmg -= fireDot;
		};

		// Apply fire damage
		DMG_Apply_Fire(att, vic, fireDot);
	}
	// ICE SPELLS ---------------------------------------------------------------------------
	else if	(spellID == SPL_Icebolt)
		||	(spellID == SPL_IceLance)
		||	(spellID == SPL_IceCube)
		||	(spellID == SPL_IceWave)
		||	(spellID == SPL_Thunderstorm)
	{
		// Check ice storm multiple collisions
		if (spellID == SPL_Thunderstorm) {
			dmg = SPL_Damage_Thunderstorm;
			var int rand; rand = Hlp_Random(100);
			if		(rand < 10) { dmg *= 4; prot *= 4; }
			else if	(rand < 50) { dmg *= 3; prot *= 3; }
			else if	(rand < 90) { dmg *= 2; prot *= 2; };
		};

		// Apply ice cube dot, remove dot dmg from hit dmg
		if	(spellID == SPL_IceCube)
		||	(spellID == SPL_IceWave)
		{
			// Calculate freeze dot
			var int freezeDot; freezeDot = SPL_FREEZE_DAMAGE;
			var int freezeDuration; freezeDuration = (dmg - prot) / freezeDot;
			if	(!C_NpcIsLarge(vic) && freezeDuration > 0) {
				// Initialize freeze effect duration and reduce dot from dmg
				vic.aivar[AIV_FreezeStateTime] = SPL_FREEZE_TIME - freezeDuration;
				dmg -= freezeDot * freezeDuration;
			} else {
				// Bypass freeze effect
				vic.aivar[AIV_FreezeStateTime] = SPL_FREEZE_TIME + 1;
			};
			//Print(ConcatStrings("Start: ", IntToString(vic.aivar[AIV_FreezeStateTime])));
		};
	}
	// LIGHTNING SPELLS ---------------------------------------------------------------------------
	else if	(spellID == SPL_Zap)
		||	(spellID == SPL_ChargeZap)
		||	(spellID == SPL_LightningFlash)
	{

		if (spellID == SPL_ChargeZap) {
			var int targets; targets = dmg / SPL_Damage_ChargeZap;
			dmg = SPL_Damage_ChargeZap;
		};

		// Check weakness
		if	(DMG_Check_Lightning_Weakness(vic))	{ prot /= 2; };
	}
	// WATER SPELLS ---------------------------------------------------------------------------
	else if	(spellID == SPL_Geyser)
		||	(spellID == SPL_WaterFist)
	{
		// Check tsunami bonus
		if (MageStaff_Blades_2H_02_Equipped) {
			dmg *= 2;
		};
	}
	// HOLY ARROW -----------------------------------------------------------------------
	else if	(spellID == SPL_PalHolyBolt)
	{
		// little hacky, but need to check here if damage was halved in collision
		if (dmg < SPL_Damage_PalHolyBolt)	{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalHolyBolt / 200; }
		else								{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalHolyBolt / 100; };
	}
	// HARM EVIL -----------------------------------------------------------------------
	else if (spellID == SPL_PalRepelEvil)
	{
		// little hacky, but need to check here if damage was halved in collision
		if (dmg < SPL_Damage_PalRepelEvil)	{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalRepelEvil / 200; }
		else								{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalRepelEvil / 100; };

		// Apply fire damage
		var int fireDot2; fireDot2 = dmg / 2;
		dmg -= fireDot2;
		DMG_Apply_Fire(att, vic, fireDot2);

		// Apply fear effect
		fear_buff_apply(vic, DOT_BURN_VFX_DURATION_S);
	}
	// DESTROY EVIL -----------------------------------------------------------------------
	else if	(spellID == SPL_PalDestroyEvil)
	{
		// little hacky, but need to check here if damage was halved in collision
		if (dmg < SPL_Damage_PalDestroyEvil)	{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalDestroyEvil / 200; }
		else									{ dmg += att.attribute[ATR_MANA_MAX] * SPL_Cost_PalDestroyEvil / 100; };
	};

	return DMG_Calculate_Minimum(att, vic, dmg - prot);
};

func int DMG_Calculate(var c_npc att, var c_npc vic, var oSDamageDescriptor dmgDesc, var int bHasHit) {
	/** Weapon modes:
		None (0x00, for spells check spellId instead)
		Fist (0x01)
		Melee (0x02)
		Ranged (0x04)
	*/
	if (dmgDesc.spellId > 0) {
		if (DMG_Check_Spell_Block(vic, dmgDesc.spellID))
		{
			Wld_PlayEffect("spellFX_Block_Suck",vic,vic,0,0,0,FALSE);
			return 0;
		};
		return DMG_Calculate_Magic(att, vic, dmgDesc.spellId, dmgDesc.dmgArray[DAM_INDEX_BARRIER] + dmgDesc.dmgArray[DAM_INDEX_FLY] + dmgDesc.dmgArray[DAM_INDEX_MAGIC]);
	}
	else if (dmgDesc.weaponMode == 1) {
		return DMG_Calculate_Fist(att, vic);
	}
	else if (dmgDesc.weaponMode == 2) {
		if (Hlp_Is_oCItem(dmgDesc.itemWeapon)) {
			var c_item wpn; wpn = _^(dmgDesc.itemWeapon);
			return DMG_Calculate_Melee(att, vic, wpn, bHasHit);
		} else {
			Print("ERROR: Could not find weapon for melee attack!");
			return 0;
		};
	};
	/* else if (dmgDesc.weaponMode == 4) {
		if (Hlp_Is_oCItem(dmgDesc.itemWeapon)) {
			var c_item projectile; projectile = _^(dmgDesc.itemWeapon);
			if (Npc_HasReadiedRangedWeapon(att))		{ DMG_Calculate_Ranged(att, vic, Npc_GetReadiedWeapon(att)); }
			else if (Npc_HasEquippedRangedWeapon(att))	{ DMG_Calculate_Ranged(att, vic, Npc_GetEquippedRangedWeapon(att)); }
			else										{ Print("ERROR: Could not find weapon for ranged attack!"); };
		};
	}; */

	Print("ERROR: Unknown damage calculation!");
	return 0;
};

func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg, var int dmgDescriptorPtr, var int bHasHit) {
	if (!victimPtr) { return dmg; };
	var oSDamageDescriptor dmgDesc; dmgDesc = _^(dmgDescriptorPtr);
	if (dmgDesc.dmgMode == DAM_FALL) { return dmg; };

	//Print (ConcatStrings ("weaponMode is: ", IntToString (dmgDesc.weaponMode)));
	//Print (ConcatStrings ("damageMode is: ", IntToString (dmgDesc.dmgMode)));
	//Print (ConcatStrings ("itemWeapon is: ", IntToString (dmgDesc.itemWeapon)));
/* 
	// If there is hitPfx but no spellId, probably AoE spell _SPREAD hitting other NPCs after a direct hit on NPC with the original projectile
	if (dmgDesc.hitPfx && dmgDesc.spellId <= 0) {
		var oCVisualFX hitPfx; hitPfx = _^(dmgDesc.hitPfx);
		//var int level; level = (hitPfx & oCVisualFX_bitfield_level) >> 13;
		//Print (ConcatStrings ("hitPfx:", ConcatStrings(hitPfx.fxName,ConcatStrings(" level:",IntToString(level)))));

		// If we still have no attacker, try to take him from PFX inflictor (e.g. AoE spells)
		if (!attackerPtr) {
			attackerPtr = hitPfx.inflictor;
		};
	};
 */
	if (attackerPtr) {
		var c_npc att; att = _^(attackerPtr);
		var c_npc vic; vic = _^(victimPtr);

		return DMG_Calculate(att, vic, dmgDesc, bHasHit);
	};

	return dmg;
};

func void _DMG_OnDmg_Post() {
	const int dmgDesc = 0;	dmgDesc = MEM_ReadInt((ESP + 640) + 4 /* &oSDamageDescriptor */); // oCNpc :: OnDamage_Hit ( oSDamageDescriptor& descDamage )
	const int bHasHit = 0;	bHasHit = MEM_ReadInt((ESP + 640) - 356 /* zBOOL bHasHit */);
	EDI = DMG_OnDmg(EBP, MEM_ReadInt(dmgDesc+8), EDI, dmgDesc, bHasHit);
};
func void InitCustomDamageHook() {
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg_Post);
};
