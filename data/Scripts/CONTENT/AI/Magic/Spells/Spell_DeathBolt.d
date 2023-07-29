// ***************
// SPL_Deathbolt
// ***************

const int SPL_Cost_Deathbolt	= 15;
const int SPL_Damage_Deathbolt	= 80;


INSTANCE Spell_Deathbolt (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Deathbolt; 
};

func int Spell_Logic_Deathbolt (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Deathbolt);
};

func void Spell_Cast_Deathbolt ()
{
	Spell_Cast_Basic(self, SPL_Cost_Deathbolt);
};
