// *******************
// Spell_BreathOfDeath
// *******************

const int SPL_Cost_BreathOfDeath	= 50;
const int SPL_Damage_BreathOfDeath  = 500;


INSTANCE Spell_BreathOfDeath(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_BreathOfDeath;	
	targetCollectRange		= 1000;
};

func int Spell_Logic_BreathOfDeath(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_BreathOfDeath);
};


func void Spell_Cast_BreathOfDeath(var int spellLevel)
{
	Spell_Cast_Basic(self, SPL_Cost_BreathOfDeath);
};


