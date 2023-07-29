// ***************
// SPL_Deathball
// ***************

const int SPL_Cost_Deathball	= 25;
const int SPL_Damage_Deathball	= 120;


INSTANCE Spell_Deathball (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Deathball; 
};

func int Spell_Logic_Deathball (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Deathball);
};

func void Spell_Cast_Deathball ()
{
	Spell_Cast_Basic(self, SPL_Cost_Deathball);
};
