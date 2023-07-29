// ******************
// SPL_Concussionbolt
// ******************

const int SPL_Cost_Concussionbolt	= 40;
const int SPL_Damage_Concussionbolt	= 150;

INSTANCE Spell_Concussionbolt (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Concussionbolt; 
};

func int Spell_Logic_Concussionbolt (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Concussionbolt);
};

func void Spell_Cast_Concussionbolt()
{
	Spell_Cast_Basic(self, SPL_Cost_Concussionbolt);
};
