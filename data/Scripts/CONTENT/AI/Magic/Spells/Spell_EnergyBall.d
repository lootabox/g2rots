// ******************
// SPL_EnergyBall	//k3 - Beliars Rage
// ******************

const int SPL_Cost_EnergyBall 		= 40;
const int SPL_Damage_EnergyBall 	= 160;

INSTANCE Spell_EnergyBall (C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_EnergyBall;
	damageType				= DAM_MAGIC;	
};

func int Spell_Logic_EnergyBall (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	return Spell_Logic_Basic(self, SPL_Cost_EnergyBall);
};

func void Spell_Cast_Energyball()
{
	Spell_Cast_Basic(self, SPL_Cost_EnergyBall);
};
