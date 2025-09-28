
// For timing out rapid spell combo animations
func void FF_RapidSpellCombo_Reset() {
	spellFxAniLetters[SPL_Firebolt] = "RPF";
	spellFxAniLetters[SPL_IceLance] = "RPF";
	spellFxAniLetters[SPL_Icebolt] = "RPF";
	spellFxAniLetters[SPL_InstantFireball] = "RPF";
	spellFxAniLetters[SPL_Zap] = "RPF";
	hero.aivar[AIV_RapidSpellCombo] = 0;
};

func int Spell_Logic_Basic (var c_npc slf, var int manaCost)
{
	if (Npc_GetActiveSpellIsScroll(slf) && (slf.attribute[ATR_MANA] >= C_GetScrollCost(manaCost)))
	{
		return SPL_SENDCAST;
	};

	// Magic staff effect
	if (MageStaff_Normal_2H_02_Equipped) {
		if	(slf.attribute[ATR_MANA] >= slf.attribute[ATR_MANA_MAX]) {
			manaCost /= 2;
		};
	};

	// Tsunami effect
	if (MageStaff_Blades_2H_02_Equipped) {
		var int spellID; spellID = Npc_GetActiveSpell(slf);
		if	(spellID == SPL_Geyser)
		||	(spellID == SPL_WaterFist) {
			manaCost *= 2;
		};
	};

	if (slf.attribute[ATR_MANA] >= manaCost)
	{
		// Typhoon staff effect
		if	(MageStaff_Blades_2H_01_Equipped) {
			// Deactive timer if active
			if (FF_Active(FF_RapidSpellCombo_Reset)) {
				FF_Remove(FF_RapidSpellCombo_Reset);
			};
			// Set animation for next (!) Casting
			if (slf.aivar[AIV_RapidSpellCombo] == 0) {
				// From the cast animation to the first rapid-fire combo (left)
				spellFxAniLetters[SPL_Firebolt] = "RP2";
				spellFxAniLetters[SPL_IceLance] = "RP2";
				spellFxAniLetters[SPL_Icebolt] = "RP2";
				spellFxAniLetters[SPL_InstantFireball] = "RP2";
				spellFxAniLetters[SPL_Zap] = "RP2";
				slf.aivar[AIV_RapidSpellCombo] = 1;
				// Set time window for next combo (is longer than usual!)
				FF_ApplyExtGT(FF_RapidSpellCombo_Reset, 600, 1);
			} else if (slf.aivar[AIV_RapidSpellCombo] == 1) {
				// From the first rapid-fire combo (left) to the second (right)
				spellFxAniLetters[SPL_Firebolt] = "RP3";
				spellFxAniLetters[SPL_IceLance] = "RP3";
				spellFxAniLetters[SPL_Icebolt] = "RP3";
				spellFxAniLetters[SPL_InstantFireball] = "RP3";
				spellFxAniLetters[SPL_Zap] = "RP3";
				slf.aivar[AIV_RapidSpellCombo] = 2;
				// Set timer for next combo
				FF_ApplyExtGT(FF_RapidSpellCombo_Reset, 600, 1);
			} else {
				// From the second rapid-fire combo (right) to the first (left)
				spellFxAniLetters[SPL_Firebolt] = "RP2";
				spellFxAniLetters[SPL_IceLance] = "RP2";
				spellFxAniLetters[SPL_Icebolt] = "RP2";
				spellFxAniLetters[SPL_InstantFireball] = "RP2";
				spellFxAniLetters[SPL_Zap] = "RP2";
				slf.aivar[AIV_RapidSpellCombo] = 1;
				// Set timer for next combo
				FF_ApplyExtGT(FF_RapidSpellCombo_Reset, 600, 1);
			};
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Basic (var c_npc slf, var int manaCost)
{
	if (Npc_GetActiveSpellIsScroll(slf))
	{
		slf.attribute[ATR_MANA] -= C_GetScrollCost(manaCost);
	}
	else
	{
		// Staff of water mage effect
		if (MageStaff_Normal_2H_02_Equipped) {
			if	(slf.attribute[ATR_MANA] >= slf.attribute[ATR_MANA_MAX]) {
				manaCost /= 2;
			};
		};

		// Tsunami effect
		if (MageStaff_Blades_2H_02_Equipped) {
			var int spellID; spellID = Npc_GetActiveSpell(slf);
			if	(spellID == SPL_Geyser)
			||	(spellID == SPL_WaterFist) {
				manaCost *= 2;
			};
		};

		slf.attribute[ATR_MANA] -= manaCost;
	};
	slf.aivar[AIV_SelectSpell] += 1;
};

func int Spell_Logic_Pal (var c_npc slf, var int manaCost)
{
	if (slf.attribute[ATR_MANA] * 100 / slf.attribute[ATR_MANA_MAX] >= manaCost)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Pal (var c_npc slf, var int manaCost)
{
	slf.attribute[ATR_MANA] -= (slf.attribute[ATR_MANA_MAX] * manaCost / 100);
	slf.aivar[AIV_SelectSpell] += 1;
};

func int Spell_Logic_Invest(var C_NPC slf, var int manaInvested, var int STEP_size, var int maxLevel, var int firstTierNoManaCost)
{
	var int STEP_cost; STEP_cost = STEP_size;
	if (Npc_GetActiveSpellIsScroll(slf)) {STEP_cost = C_GetScrollCost(STEP_cost);}
	else
	{
		// Typhoon staff effect
		if (MageStaff_Blades_2H_01_Equipped) {
			STEP_size /= 2;
		};
	};

	if (manaInvested == 0) {
		if (slf.attribute[ATR_MANA] < STEP_cost) { return SPL_SENDSTOP; }; // plays special animation at manaInvested 0
		if (firstTierNoManaCost == FALSE) { slf.attribute[ATR_MANA] -= STEP_cost; };
		slf.aivar[AIV_SpellLevel] = 0; // make sure to start at 0
	};

	var int tier; tier = manaInvested / STEP_size;
	if (slf.aivar[AIV_SpellLevel] < tier)
	{
		if (tier == maxLevel)
		|| (slf.attribute[ATR_MANA] < STEP_cost)
		{
			return SPL_SENDCAST; // fire latest at max level or if trying to advance without enough mana
		};
		slf.attribute[ATR_MANA] -= STEP_cost;
		slf.aivar[AIV_SpellLevel] = tier;
		return SPL_NEXTLEVEL; // advance tier
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC; // can invest, cannot advance
};


// Addresses for blink / summon
const int zCWayNet__GetWaypoint					= 8061744; //0x7B0330
const int zCWayNet__InsertWaypoint				= 8048896; //0x7AD100
const int zCWaypoint___CreateNewInstance		= 8076144; //0x7B3B70
const int zCWaypoint__SetName					= 8059824; //0x7AFBB0
const int zCWaypoint__CorrectHeight				= 8061088; //0x7B00A0
const int zCWaypoint__CorrectHeight_maxDepth	= 8061133; //0x7B00CD

const string SPL_BLINK_WP						= "WP_SPL_BLINK"; // The name should be unique

func int Move_Aim_Waypoint(var C_NPC slf)
{
	// --- Check if spell failed ---

	// Retrieve position from aim vob
	var int vobPtr; vobPtr = GFA_SetupAimVob(0);
	if (!vobPtr) {
		// MEM_Error("Move_Aim_Waypoint: Failed to retrieve destination (aim vob)"); // Don't break immersion
		AI_PlayAni(slf, "T_CASTFAIL"); // Much nicer
		Wld_PlayEffect("SPELLFX_FEAR_GROUND", slf, slf, 0, 0, 0, FALSE);
		MEM_Warn("Move_Aim_Waypoint: Failed to retrieve destination (aim vob)");
		return FALSE;
	};
	var zCVob vob; vob = _^(vobPtr);
	var zCVob caster; caster = Hlp_GetNpc(slf);

	// Safety first: Line of sight to target location is obstructed, cancel to prevent traversing through walls
	if (!Npc_CanSeeItem(slf, vob)) {
		AI_PlayAni(slf, "T_CASTFAIL");
		MEM_Warn("Move_Aim_Waypoint: Destination out of sight (aim vob)");
		return FALSE;
	};


	// --- Set up destination way point ---

	// Just for completeness (NPCs cannot use this spell with free aim)
	slf.aivar[AIV_SelectSpell] += 1;

	var int pos[6]; // Combined pos[3] and dir[3]
	pos[0] = vob.trafoObjToWorld[ 3];  pos[3] = caster.trafoObjToWorld[ 2];
	pos[1] = vob.trafoObjToWorld[ 7];  pos[4] = caster.trafoObjToWorld[ 6];
	pos[2] = vob.trafoObjToWorld[11];  pos[5] = caster.trafoObjToWorld[10];

	// Search for destination way point
	var int waynetPtr; waynetPtr = _@(MEM_Waynet);
	var int wpNamePtr; wpNamePtr = _@s(SPL_BLINK_WP);
	var int wpPtr;
	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo(_@(wpPtr));
		CALL__fastcall(_@(waynetPtr), _@(wpNamePtr), zCWayNet__GetWaypoint);
		call = CALL_End();
	};

	// Create way point if it does not exit yet
	if (!wpPtr) {
		MEM_Info("Move_Aim_Waypoint: Creating destination way point."); // Should be printed only once for each world

		CALL__cdecl(zCWaypoint___CreateNewInstance); // This allocates the necessary memory
		wpPtr = CALL_RetValAsPtr();

		CALL_zStringPtrParam(SPL_BLINK_WP);
		CALL__thiscall(wpPtr, zCWaypoint__SetName);

		CALL_PtrParam(wpPtr);
		CALL__thiscall(_@(MEM_Waynet), zCWayNet__InsertWaypoint);
	};

	// Update way point position and direction
	var zCWaypoint wp; wp = _^(wpPtr);
	MEM_CopyWords(_@(pos), _@(wp.pos), 6); // Set zCWaypoint.pos[3] and zCWaypoint.dir[3]


	// --- Correct way point height ---
	// Set longer ground check trace ray in zCWaypoint::CorrectHeight
	MemoryProtectionOverride(zCWaypoint__CorrectHeight_maxDepth, 4);
	var int traceLengthBak; traceLengthBak = MEM_ReadInt(zCWaypoint__CorrectHeight_maxDepth);
	MEM_WriteInt(zCWaypoint__CorrectHeight_maxDepth, mkf(-2000)); // Enlarge trace ray length

	// Align way point to ground to prevent AI_Teleport to transition through walls on different stories/levels
	var int worldPtr; worldPtr = _@(MEM_World);
	const int call2 = 0;
	if (CALL_Begin(call2)) {
		CALL_PtrParam(_@(worldPtr));
		CALL__thiscall(_@(wpPtr), zCWaypoint__CorrectHeight);
		call2 = CALL_End();
	};

	// Revert trace ray length
	MEM_WriteInt(zCWaypoint__CorrectHeight_maxDepth, traceLengthBak);

	// Visualize the height correction for debugging purposes
	if (FALSE) {
		if (!Hlp_IsValidHandle(h)) {
			var int h; h = DrawLine(_@(wp.pos), _@(pos), zCOLOR_RED);
		} else {
			UpdateLine(h, _@(wp.pos), _@(pos));
		};
	};

	return TRUE;
};

func void Spell_Cast_Focus(var C_NPC slf, var C_NPC oth, var int spellID, var int spellCat, var int spellDamage, var string spellFX)
{
	// Backup self/other and reverse slf/oth in their place
	var C_NPC selfTemp; selfTemp = Hlp_GetNpc (self);
	var C_NPC otherTemp; otherTemp = Hlp_GetNpc (other);
	self = Hlp_GetNpc(oth); other = Hlp_GetNpc(slf);

	// Handle collision, if no collision restore backup self/other and return
	var int coll; coll = C_CanNpcCollideWithSpell(spellID);
	if (coll == COLL_DONOTHING)
	{
		self = Hlp_GetNpc(selfTemp); other = Hlp_GetNpc(otherTemp);
		return;
	};

	// Collided, set last hit spell and assess magic
	var oCNpc selfOC; selfOC = Hlp_GetNpc(self);
	Print(IntToString(selfOC.lastHitSpellID));
	selfOC.lastHitSpellID = spellID;
	selfOC.lastHitSpellCat = spellCat;
	B_AssessMagic();

	// Restore backup self/other, use slf/oth from now on
	self = Hlp_GetNpc(selfTemp); other = Hlp_GetNpc(otherTemp);

	// Calculate and apply damage
	if (coll & COLL_APPLYDOUBLEDAMAGE)	{ spellDamage *= 2; };
	if (coll & COLL_APPLYHALVEDAMAGE)	{ spellDamage /= 2; };
	var int dmg; dmg = DMG_Calculate_Magic(slf, oth, spellID, spellDamage);
	if (dmg > 0) { B_MagicHurtNpc(slf, oth, dmg); };

	// Play vfx
	Wld_PlayEffect(spellFX, oth, oth, 0, 0, 0, FALSE);
};

func int Spell_Logic_Invest_Summon(var C_NPC slf, var int manaInvested, var int manaCost, var int maxLevel)
{
	// Npcs cant handle charge summons...
	if (!Npc_IsPlayer(slf))
	{
		return Spell_Logic_Basic(slf, manaCost);
	};

	return Spell_Logic_Invest(slf, manaInvested, manaCost, maxLevel, FALSE);
};

func void Spell_Cast_Summon(var C_NPC slf, var int npcSummonInstance, var int playerSummonInstance, var int summonCount) {
	// Npcs cant handle charge summons...
	if (!Npc_IsPlayer(slf))
	{
		Wld_SpawnNpcRange	(slf,	npcSummonInstance,			summonCount,	500);
		slf.aivar[AIV_SelectSpell] += 1;
		return;
	};

	// Enforce player summon limit
	BroadcastEx(slf, BC_Kill_Summon, TRUE, FALSE, FALSE);

	if (GFA_ACTIVE)
	{
		if (Move_Aim_Waypoint(slf))
		{
			repeat(i, summonCount); var int i;
				Wld_InsertNpc(playerSummonInstance, SPL_BLINK_WP);
			end;
			//Vob_PlayEffect (SPL_BLINK_WP, "spellFX_SummonCreature_ORIGIN");
			//Wld_PlayEffect("spellFX_SummonCreature_ORIGIN", self, self, 0, 0, 0, FALSE);
			return;
		};
	};

	// Fallback incase free aim is off or moving the aim waypoint is not possible for some reason
	Wld_SpawnNpcRange(slf, playerSummonInstance, summonCount, 500);
};

func void BC_Kill_Summon(var C_NPC slf, var C_NPC npc)
{
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (slf.guild == GIL_SUMMONED_WOLF)
		|| (slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
		|| (slf.guild == GIL_SUMMONED_SKELETON)
		//|| (slf.guild == GIL_SUMMONED_GOLEM)
		|| (slf.guild == GIL_SUMMONED_DEMON)
		//|| (slf.guild == GIL_SummonedGuardian)
		//|| (slf.guild == GIL_SummonedZombie)
		{
			Npc_ChangeAttribute	(slf, ATR_HITPOINTS, -slf.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};
