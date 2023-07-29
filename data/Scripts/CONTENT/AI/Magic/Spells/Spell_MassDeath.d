// *************
// SPL_MassDeath
// *************

const int SPL_Cost_MassDeath		= 150;
const int SPL_Damage_MassDeath 		= 666;


INSTANCE Spell_MassDeath (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_MassDeath;	
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
};

func int Spell_Logic_Massdeath (var int manaInvested)
{	
	return Spell_Logic_Basic(self, SPL_Cost_MassDeath);
};


func void Spell_Cast_Massdeath()
{
	Spell_Cast_Basic(self, SPL_Cost_MassDeath);
};
