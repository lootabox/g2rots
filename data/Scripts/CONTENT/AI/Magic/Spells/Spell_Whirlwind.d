// *************
// SPL_Whirlwind	K2
// *************

const int	SPL_Cost_Whirlwind			=	30;
const int   SPL_Whirlwind_DAMAGE		=	0;	
const int	SPL_TIME_WHIRLWIND			=	10;	

INSTANCE Spell_Whirlwind (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - INSTANT-Spell
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	damage_per_level 		= 60;					//Schaden wird im ZS_MagicFreeze angegeben!
};

func int Spell_Logic_Whirlwind (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	return Spell_Logic_Basic(self, SPL_Cost_Whirlwind);
};

func void Spell_Cast_Whirlwind()
{
	Spell_Cast_Basic(self, SPL_Cost_Whirlwind);
};
