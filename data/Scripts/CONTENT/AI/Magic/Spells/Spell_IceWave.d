// ***********
// SPL_IceWave
// ***********

const int	SPL_Cost_IceWave			=	60;
//SPL_FREEZE_DAMAGE	und SPL_FREEZE_TIME	siehe SPL_IceCube


INSTANCE Spell_IceWave (C_Spell_Proto)
{
	time_per_mana			= 0;					// Wert wird nicht gebraucht - INSTANT-Spell
	damage_per_level 		= SPL_Damage_IceCube;	// Relativer Schaden je nach Opfer wird im zs_MagicFreeze angegeben!
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "eingefroren"
};

func int Spell_Logic_IceWave(var int manaInvested) //Parameter wird hier nicht gebraucht
{
	return Spell_Logic_Basic(self, SPL_Cost_IceWave);
};

func void Spell_Cast_IceWave()
{
	Spell_Cast_Basic(self, SPL_Cost_IceWave);
};
