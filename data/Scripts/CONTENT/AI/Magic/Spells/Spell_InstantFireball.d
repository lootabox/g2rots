// *******************
// SPL_InstantFireball
// *******************

const int SPL_Cost_InstantFireball			= 10;
const int SPL_Damage_InstantFireball 		= 60;


INSTANCE Spell_InstantFireball (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_DAMAGE_InstantFireball;
	damageType				= DAM_MAGIC;									// war vorher DAM_FIRE
};

func int Spell_Logic_InstantFireball (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_InstantFireball);
};


func void Spell_Cast_InstantFireball()
{
	Spell_Cast_Basic(self, SPL_Cost_InstantFireball);
};
