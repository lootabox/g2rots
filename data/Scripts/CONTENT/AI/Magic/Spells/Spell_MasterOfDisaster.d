// ********************
// SPL_MasterOfDisaster
// ********************

const int SPL_Cost_MasterOfDisaster		= 60;
const int SPL_Damage_MasterOfDisaster	= 300;


INSTANCE Spell_MasterOfDisaster	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level 		= SPL_DAMAGE_MasterOfDisaster;
	damageType				= 	DAM_MAGIC;	
};

func int Spell_Logic_MasterOfDisaster	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_MasterOfDisaster);
};

func void Spell_Cast_MasterOfDisaster()
{
	Spell_Cast_Basic(self, SPL_Cost_MasterOfDisaster);
};
