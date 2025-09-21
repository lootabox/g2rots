//------------------------------------------------------------------------------------------
//AddOn Runen, by KaiRo
//------------------------------------------------------------------------------------------
//Constanten 

// Kreis des Wassers
const	int	Value_Ru_Icelance			=	1000;
const	int	Value_Ru_Whirlwind			=	1000;
const	int	Value_Ru_Thunderstorm		=	2000;
const	int	Value_Ru_Geyser				=	1500;
const	int	Value_Ru_Waterfist			=	2000;


// Maya Magic
const	int	Value_Ru_Greententacle		=	2500;
const	int	Value_Ru_Swarm				=	1500;
const	int	Value_Ru_Energyball			=	3500;
const	int	Value_Ru_SuckEnergy			=	3500;
const	int	Value_Ru_Skull				=	2000;
const 	int Value_Ru_SummonGuardian		=	2000;
const 	int Value_Ru_SummonZombie		=	2000;


//#######################################################
//		KDW
//#######################################################

/*******************************************************************************************/
INSTANCE ItRu_Thunderstorm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Thunderstorm;

	visual				=	"ItRu_Water05.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Thunderstorm;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Thunderstorm;
	mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Thunderstorm;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Thunderstorm;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_Thunderstorm;

	TEXT	[3]			=	NAME_IceStorm_Info;
	
	TEXT	[4]			=	NAME_AreaOfEffect_Large;

	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;

};
/*******************************************************************************************/
INSTANCE ItRu_Whirlwind (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Whirlwind;

	visual				=	"ItRu_Water02.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Whirlwind;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Whirlwind;	
	mag_circle			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Whirlwind;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Whirlwind;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_WHIRLWIND;
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Geyser (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Geyser;

	visual				=	"ItRu_Water01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Geyser;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Geyser;	
	mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Geyser;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Geyser;
	
	TEXT	[2]			=	NAME_Dam_Magic;		
	COUNT	[2]			=	SPL_DAMAGE_Geyser;

	TEXT	[3]			=	NAME_Instant;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Waterfist	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Waterfist;

	visual				=	"ItRu_Water03.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Waterfist;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Waterfist;	
	mag_circle			=	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Waterfist;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Waterfist;
	
	TEXT	[2]			=	NAME_Dam_Magic;		
	COUNT	[2]			=	SPL_DAMAGE_Waterfist;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Icelance	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Icelance;

	visual				=	"ItRu_Water04.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Icelance;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Icelance;	
	mag_circle			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icelance;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Icelance;
	
	TEXT	[2]			=	NAME_Dam_Magic;		
	COUNT	[2]			=	SPL_DAMAGE_Icelance;

	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

//#############################################
//		Beliar
//#############################################


/*******************************************************************************************/
INSTANCE ItRu_BeliarsRage	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Energyball;

	visual				=	"ItRu_Beliar04.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Energyball;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Energyball;	
	//mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BeliarsRage;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Energyball;
	
	TEXT	[2]			=	NAME_Dam_Magic;		
	COUNT	[2]			=	SPL_DAMAGE_Energyball;

	TEXT	[3]			=	NAME_BeliarsRage_Info;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_SuckEnergy	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SuckEnergy;

	visual				=	"ItRu_Beliar01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SuckEnergy;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_SuckEnergy;	
	//mag_circle			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_SuckEnergy;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SuckEnergy;
	
	TEXT	[2]			=	NAME_DamagePerSec;		
	COUNT	[2]			=	SPL_SuckEnergy_Damage;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_SuckEnergy;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_GreenTentacle (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Greententacle;

	visual				=	"ItRu_Beliar03.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Greententacle;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Greententacle;	
	//mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_GreenTentacle;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Greententacle;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_Greententacle;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Swarm	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Swarm;

	visual				=	"ItRu_Beliar02.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Swarm;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Swarm;	
	//mag_circle			=	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Swarm;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Swarm;
	
	TEXT	[2]			=	NAME_DamagePerSec;		
	COUNT	[2]			=	SPL_Swarm_Damage;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_Swarm;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Skull	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Skull;

	visual				=	"ItRu_Beliar05.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Skull;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_Skull;	
	//mag_circle			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Skull;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_MinManakosten;			
	COUNT	[1]			=	SPL_Cost_Skull;
	
	TEXT	[2]			=	NAME_Addon_NeedsAllMana;
	
	
	TEXT	[4]			=	NAME_Dam_Magic;			
	COUNT	[4]			=	SPL_Damage_Skull;		
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_SummonZombie	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SummonZombie;

	visual				=	"ItRu_Beliar07.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonZombie;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_SummonZombie;	
	//mag_circle			=	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_SummonZombie;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonZombie;

	TEXT 	[2]			=   NAME_SummonZombie_Info;

	TEXT	[3]			=	ConcatStrings(ConcatStrings(NAME_SummonIngredient_Info, "Old Coin"), " (for each soul)");
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_SummonGuardian	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SummonGuardian;

	visual				=	"ItRu_Beliar06.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGuardian;
	cond_atr[2]			=	ATR_MANA_MAX;
	cond_value[2]		=	SPL_Cost_SummonGuardian;	
	//mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_SummonGuardian;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGuardian;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
