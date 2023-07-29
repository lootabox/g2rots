// ******************
// SPL_LightningFlash
// ******************

const int SPL_Cost_LightningFlash 		= 20;
const int SPL_Damage_LightningFlash 	= 120;

INSTANCE Spell_LightningFlash (C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_LightningFlash;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= FIGHT_DIST_CANCEL;
};

func int Spell_Logic_LightningFlash (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	return Spell_Logic_Basic(self, SPL_Cost_LightningFlash);
};

func void Spell_Cast_LightningFlash()
{
	Spell_Cast_Focus(self, other, SPL_LightningFlash, SPELL_BAD, SPL_Damage_LightningFlash, "spellFX_LightningFlash_HEAVENSRAGE");
	Spell_Cast_Basic(self, SPL_Cost_LightningFlash);
};
