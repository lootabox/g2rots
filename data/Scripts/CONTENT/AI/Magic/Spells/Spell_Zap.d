// ***********
// SPL_Daze
// ***********

const int SPL_Cost_Zap		= 6;
const int SPL_Damage_Zap 	= 30;

INSTANCE Spell_Zap (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Zap;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Zap (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Zap);
};


func void Spell_Cast_Zap(var int spellLevel)
{
	Spell_Cast_Basic(self, SPL_Cost_Zap);
};
