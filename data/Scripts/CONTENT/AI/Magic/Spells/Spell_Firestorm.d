// *************
// SPL_FireStorm  ALIAS INSTANTFIRESTORM
// *************

const int SPL_Cost_InstantFireStorm			= 20;
const int SPL_Damage_InstantFireStorm 		= 60;

INSTANCE Spell_Firestorm (C_Spell_Proto)
{
	time_per_mana				= 0;
	damage_per_level			= 	SPL_Damage_InstantFireStorm;
	damageType					= 	DAM_MAGIC;	// war vorher DAM_FIRE für feuereffekte
};

func int Spell_Logic_Firestorm	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_InstantFireStorm);
};


func void Spell_Cast_Firestorm()
{
	Spell_Cast_Basic(self, SPL_Cost_InstantFireStorm);
};

