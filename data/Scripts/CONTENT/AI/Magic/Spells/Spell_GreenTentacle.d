// *****************
// SPL_Greententacle	/k2
// *****************

const int SPL_Cost_Greententacle	= 50;
const int SPL_TIME_Greententacle	= 20;

INSTANCE Spell_Greententacle (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1500;
	spelltype 				= SPELL_NEUTRAL;
};

func int Spell_Logic_Greententacle (var int manaInvested)
{	
	return Spell_Logic_Basic(self, SPL_Cost_Greententacle);
};


func void Spell_Cast_Greententacle()
{
	Spell_Cast_Basic(self, SPL_Cost_Greententacle);
};
