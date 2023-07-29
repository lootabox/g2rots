
var int PlayerIsTransformed;
var int TransformSpellID;

var C_ITEM PreTransformWeaponMelee;
var C_ITEM PreTransformWeaponRanged;

func void B_TransformStart(var int SpellID)
{
	if(PlayerIsTransformed == FALSE)
	{
		Wld_StopEffect("SLOW_MOTION");
		// Cache equipped weapon
		PreTransformWeaponMelee = Npc_GetEquippedMeleeWeapon(hero);
		PreTransformWeaponRanged = Npc_GetEquippedRangedWeapon(hero);
		// cache player level and replace it with the level of the beast
		hero.aivar[REAL_LEVEL] = hero.level;

		// bugfix: before transform add additional scroll to inventory, so they won't switch equipped item
		TransformSpellID = SpellID;
			 if (SpellID == SPL_TrfSheep)			{ hero.level = 1;	CreateInvItem(hero, ItSc_TrfSheep); }
		else if (SpellID == SPL_TrfScavenger)		{ hero.level = 7;	CreateInvItem(hero, ItSc_TrfScavenger); }
		else if (SpellID == SPL_TrfGiantRat)		{ hero.level = 3;	CreateInvItem(hero, ItSc_TrfGiantRat); }
		else if (SpellID == SPL_TrfGiantBug)		{ hero.level = 8;	CreateInvItem(hero, ItSc_TrfGiantBug); }
		else if (SpellID == SPL_TrfWolf)			{ hero.level = 6;	CreateInvItem(hero, ItSc_TrfWolf); }
		else if (SpellID == SPL_TrfWaran)			{ hero.level = 12;	CreateInvItem(hero, ItSc_TrfWaran); }
		else if (SpellID == SPL_TrfSnapper)			{ hero.level = 12;	CreateInvItem(hero, ItSc_TrfSnapper); }
		else if (SpellID == SPL_TrfWarg)			{ hero.level = 30;	CreateInvItem(hero, ItSc_TrfWarg); }
		else if (SpellID == SPL_TrfFireWaran)		{ hero.level = 30;	CreateInvItem(hero, ItSc_TrfFireWaran); }
		else if (SpellID == SPL_TrfLurker)			{ hero.level = 12;	CreateInvItem(hero, ItSc_TrfLurker); }
		else if (SpellID == SPL_TrfShadowbeast)		{ hero.level = 30;	CreateInvItem(hero, ItSc_TrfShadowbeast); }
		else if (SpellID == SPL_TrfDragonSnapper)	{ hero.level = 40;	CreateInvItem(hero, ItSc_TrfDragonSnapper); };

		PlayerLevelsDuringTransform = 0;
		PlayerIsTransformed = TRUE;
	};
};

func void B_TransformStop()
{
	if(PlayerIsTransformed == TRUE)
	{
		// at the end of transformation, kill the beast
		self.attribute[ATR_HITPOINTS] = 0;

		// bugfix: make sure everything is unequipped
 		var C_ITEM PostTransformWeaponMelee; PostTransformWeaponMelee = Npc_GetEquippedMeleeWeapon(hero);
		var C_ITEM PostTransformWeaponRanged; PostTransformWeaponRanged = Npc_GetEquippedRangedWeapon(hero);
		if (Hlp_IsValidItem(PostTransformWeaponMelee))	{ Unequip_Item(hero, Hlp_GetInstanceId(PostTransformWeaponMelee)); };
		if (Hlp_IsValidItem(PostTransformWeaponRanged))	{ Unequip_Item(hero, Hlp_GetInstanceId(PostTransformWeaponRanged)); };

		// remove and re-equip weapons that were equipped before transform (??? not working ???)
		//if (Hlp_IsValidItem(PreTransformWeaponMelee))	{ Npc_RemoveInvItem(hero, Hlp_GetInstanceId(PreTransformWeaponMelee)); Equip_Item(hero, Hlp_GetInstanceId(PreTransformWeaponMelee)); };
		//if (Hlp_IsValidItem(PreTransformWeaponRanged))	{ Npc_RemoveInvItem(hero, Hlp_GetInstanceId(PreTransformWeaponRanged)); Equip_Item(hero, Hlp_GetInstanceId(PreTransformWeaponRanged)); };

		// bugfix: remove additional scroll
			 if (TransformSpellID == SPL_TrfSheep)			{ Npc_RemoveInvItem(hero, ItSc_TrfSheep); }
		else if (TransformSpellID == SPL_TrfScavenger)		{ Npc_RemoveInvItem(hero, ItSc_TrfScavenger); }
		else if (TransformSpellID == SPL_TrfGiantRat)		{ Npc_RemoveInvItem(hero, ItSc_TrfGiantRat); }
		else if (TransformSpellID == SPL_TrfGiantBug)		{ Npc_RemoveInvItem(hero, ItSc_TrfGiantBug); }
		else if (TransformSpellID == SPL_TrfWolf)			{ Npc_RemoveInvItem(hero, ItSc_TrfWolf); }
		else if (TransformSpellID == SPL_TrfWaran)			{ Npc_RemoveInvItem(hero, ItSc_TrfWaran); }
		else if (TransformSpellID == SPL_TrfSnapper)		{ Npc_RemoveInvItem(hero, ItSc_TrfSnapper); }
		else if (TransformSpellID == SPL_TrfWarg)			{ Npc_RemoveInvItem(hero, ItSc_TrfWarg); }
		else if (TransformSpellID == SPL_TrfFireWaran)		{ Npc_RemoveInvItem(hero, ItSc_TrfFireWaran); }
		else if (TransformSpellID == SPL_TrfLurker)			{ Npc_RemoveInvItem(hero, ItSc_TrfLurker); }
		else if (TransformSpellID == SPL_TrfShadowbeast)	{ Npc_RemoveInvItem(hero, ItSc_TrfShadowbeast); }
		else if (TransformSpellID == SPL_TrfDragonSnapper)	{ Npc_RemoveInvItem(hero, ItSc_TrfDragonSnapper); };

		// restore level and hitpoints of player, taking into account levelups during transformation
		if(PlayerLevelsDuringTransform > 0)
		{
			hero.aivar[REAL_LEVEL] += PlayerLevelsDuringTransform;
			hero.level = hero.aivar[REAL_LEVEL];
			hero.attribute[ATR_HITPOINTS_MAX] += PlayerLevelsDuringTransform * GetHitpointGainPerLevel();
			hero.attribute[ATR_HITPOINTS] += PlayerLevelsDuringTransform * GetHitpointGainPerLevel();
		};

		PlayerIsTransformed = FALSE;
	};
};
