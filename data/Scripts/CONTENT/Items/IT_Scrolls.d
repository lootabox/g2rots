//*****************************************************************************
//			Scrolls
//*****************************************************************************

// Paladin Scrolls
const 	string Name_PaladinScroll		=	"Paladin Scroll";
const	int	Value_Sc_PalLight			=	50;
const	int	Value_Sc_PalLightHeal		=	100;
const	int	Value_Sc_PalHolyBolt		=	200;
const	int	Value_Sc_PalMediumHeal		=	400;
const	int	Value_Sc_PalRepelEvil		=	600;
const	int	Value_Sc_PalFullHeal		=	800;
const	int	Value_Sc_PalDestroyEvil		=	1000;

// Magier Scrolls
const int 	Value_Sc_Light				=  	10;
const int 	Value_Sc_Firebolt			=	25;
const int 	Value_Sc_Charm				=   100;
const int 	Value_Sc_Icebolt			=	25;
const int 	Value_Sc_LightHeal			=	25;
const int 	Value_Sc_SumGobSkel			=  	75;
const int 	Value_Sc_InstantFireball	=	50;
	
const int 	Value_Sc_Zap				=	60;
const int 	Value_Sc_SumWolf			=	75;
const int 	Value_Sc_Windfist			=	60;
const int 	Value_Sc_Sleep				=	100;
const int 	Value_Sc_MediumHeal			=	60;
const int 	Value_Sc_LightningFlash		=	125;
const int 	Value_Sc_ChargeFireball		=	60;
const int 	Value_Sc_SumSkel			=	75;
const int 	Value_Sc_Fear				=	200;
const int 	Value_Sc_IceCube			=	100;

const int 	Value_Sc_ThunderBall		=	75;
const int 	Value_Sc_SumGol				=	150;
const int 	Value_Sc_HarmUndead			=	75;
const int 	Value_Sc_Pyrokinesis		=	150;

const int 	Value_Sc_Firestorm			=	100;
const int 	Value_Sc_IceWave			=	200;
const int 	Value_Sc_SumDemon			=	200;
const int 	Value_Sc_FullHeal			=	200;
const int 	Value_Sc_Shrink				=	200;

const int 	Value_Sc_Firerain			=	250;
const int 	Value_Sc_BreathOfDeath		=	250;
const int 	Value_Sc_MassDeath			=	250;
const int 	Value_Sc_ArmyOfDarkness		=	250;

const int 	Value_Sc_TrfSheep			= 25;
const int 	Value_Sc_TrfGiantRat		= 50;
const int 	Value_Sc_TrfScavenger		= 100;
const int 	Value_Sc_TrfWolf			= 150;
const int 	Value_Sc_TrfGiantBug		= 150;
const int 	Value_Sc_TrfLurker			= 200;
const int 	Value_Sc_TrfWaran			= 200;
const int 	Value_Sc_TrfSnapper			= 250;
const int 	Value_Sc_TrfWarg			= 300;
const int 	Value_Sc_TrfDragonSnapper	= 350;
const int 	Value_Sc_TrfFireWaran		= 400;
const int 	Value_Sc_TrfShadowbeast		= 500;

/*******************************************************************************************/
// 			Paladin Scrolls 
/*******************************************************************************************/
INSTANCE ItSc_PalLight (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalLight;

	visual				=	"ItSc_PalLight.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalLight;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_PalLight;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLight;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
	//TEXT	[1]			=	NAME_Manakosten;
	//COUNT	[1]			=	SPL_Cost_PalLight;
	
	TEXT	[2]			=	NAME_Duration_Per;
	COUNT	[2]			=	SPL_Duration_PalLIGHT;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalLightHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalLightHeal;

	visual				=	"ItSc_PalLightHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalLightHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_PalLightHeal;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLightHeal;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalLightHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_PalLightHeal;

	TEXT	[3]			=	NAME_PalHeal_Info;

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalHolyBolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalHolyBolt;

	visual				=	"ItSc_PalHolyBolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalHolyBolt;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_PalHolyBolt;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";


	description			=	NAME_SPL_PalHolyBolt;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalHolyBolt;

	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_PalHolyBolt;

	TEXT	[3]			=	NAME_PalCombat_Info;

	TEXT	[4]			=	NAME_EvilOrHalf;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalMediumHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalMediumHeal;

	visual				=	"ItSc_PalMediumHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalMediumHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_PalMediumHeal;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalMediumHeal;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalMediumHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_PalMediumHeal;

	TEXT	[3]			=	NAME_PalHeal_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalRepelEvil (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalRepelEvil;

	visual				=	"ItSc_PalRepelEvil.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalRepelEvil;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_PalRepelEvil;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalRepelEvil;
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalRepelEvil;

	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_PalRepelEvil;

	TEXT	[3]			=	NAME_PalCombat_Info;

	TEXT	[4]			=	ConcatStrings(NAME_PalRepelEvil_Info, NAME_MustBeEvil);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalFullHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalFullHeal;

	visual				=	"ItSc_PalFullHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalFullHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_PalFullHeal;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalFullHeal;
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalFullHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_PalFullHeal;

	TEXT	[3]			=	NAME_PalHeal_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalDestroyEvil (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalDestroyEvil;

	visual				=	"ItSc_PalDestroyEvil.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalDestroyEvil;
	cond_atr[2]   			=	ATR_MANA_MAX;
	cond_value[2]  			=	SPL_Cost_PalDestroyEvil;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalDestroyEvil;
	TEXT	[0]			=	Name_PaladinScroll	;
	
//	TEXT	[1]			=	NAME_Manakosten;
	TEXT	[1]			=	NAME_Manakosten_Pal;
	COUNT	[1]			=	SPL_Cost_PalDestroyEvil;

	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_PalDestroyEvil;

	TEXT	[3]			=	NAME_PalDestroyEvil_Info;

	TEXT	[4]			=	ConcatStrings(NAME_FatalOrHalf, ConcatStrings(NAME_MustBeEvil, NAME_Instant));
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
// 			Magier Scrolls 
/*******************************************************************************************/
instance ItSc_Light (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Light.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	C_GetScrollCost(SPL_Cost_Light);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LIGHT;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Light);
	
	TEXT	[2]			=	NAME_Duration_Per;
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firebolt;

	visual				=	"ItSc_Firebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIREBOLT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	C_GetScrollCost(SPL_Cost_Firebolt);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Firebolt;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Firebolt);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_FIREBOLT;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Icebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Icebolt;

	visual				=	"ItSc_Icebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Icebolt;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Icebolt);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icebolt;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Icebolt);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_Icebolt;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_LightHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_LightHeal;

	visual				=	"ItSc_LightHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LightHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_LightHeal);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_LightHeal);
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_LightHeal;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_SumGobSkel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumGobSkel;

	visual				=	"ItSc_SumGobSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonGoblinSkeleton;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_SummonGoblinSkeleton);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinSkeleton;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_SummonGoblinSkeleton);

	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_Duration_SummonGoblinSkeleton;

	TEXT	[3]			=	NAME_SumGobSkel_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_InstantFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_InstantFireball;

	visual				=	"ItSc_InstantFireball.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_InstantFireball;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_InstantFireball);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantFireball;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_InstantFireball);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_InstantFireball;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Zap (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Zap;

	visual				=	"ItSc_Zap.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Zap;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_Zap);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Zap;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Zap);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_ZAP;

	TEXT	[3]			=	ConcatStrings(NAME_Zap_Living, NAME_Sec_Duration);
	COUNT	[3]			=	SPL_TIME_SHORTZAPPED;

	TEXT	[4]			=	NAME_Nonlethal;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumWolf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumWolf;

	visual				=	"ItSc_SumWolf.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonWolf;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_SummonWolf);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonWolf;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_SummonWolf);

	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_Duration_SummonWolf;

	TEXT	[3]			=	NAME_SumWolf_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Windfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Windfist.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_WINDFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_WindFist);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_WINDFIST;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_WindFist);
	
	TEXT	[2]			=	NAME_Dam_Magic_Per;
	count 	[2]			=   SPL_Damage_Windfist;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Sleep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SLEEP;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Sleep);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Sleep;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Sleep);
	
	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_TIME_Sleep;

	TEXT	[3]			=	NAME_Instant;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_Charm(C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Sc_Charm;

	//visual				=	"ItSc_Sleep.3DS";
	visual 				=	"ItSc_Charm.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_CHARM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Charm);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Charm;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Charm);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_MediumHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_MediumHeal;

	visual				=	"ItSc_MediumHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_MediumHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_MediumHeal);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_MediumHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_MediumHeal);
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_MediumHeal;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_LightningFlash (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_LightningFlash;

	visual				=	"ItSc_LightningFlash.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LightningFlash;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_LightningFlash);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightningFlash;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_LightningFlash);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_LightningFlash;

	TEXT	[3]			=	ConcatStrings(NAME_Zap_Living, NAME_Sec_Duration);
	COUNT	[3]			=	SPL_TIME_ZAPPED;

	TEXT	[4]			=	ConcatStrings(NAME_Instant, NAME_DamagePerSec);
	COUNT	[4]			=	SPL_ZAPPED_DAMAGE_PER_SEC;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ChargeFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ChargeFireball;

	visual				=	"ItSc_ChargeFireball.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ChargeFireball;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_ChargeFireball);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_ChargeFireball;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_ChargeFireball);
	
	TEXT	[2]			=	NAME_Dam_Magic_Per;
	count 	[2]			=   SPL_Damage_ChargeFireball;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumSkel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumSkel;

	visual				=	"ItSc_SumSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONSKELETON;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_SummonSkeleton);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonSkeleton;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_SummonSkeleton);

	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_Duration_SummonSkeleton;

	TEXT	[3]			=	NAME_SumSkel_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Fear (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Fear;

	visual				=	"ItSc_Fear.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FEAR;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Fear);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Fear;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Fear);
	
	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_TIME_Fear;

	TEXT	[3]			=	NAME_Fear_Info;

	TEXT	[4]			=	ConcatStrings(NAME_AreaOfEffect_Default, NAME_MustBeLiving);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceCube (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_IceCube;

	visual				=	"ItSc_IceCube.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICECUBE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_IceCube);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceCube;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_IceCube);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_IceCube;
	
	TEXT	[3]			=	ConcatStrings(NAME_Dot_Full, NAME_DamagePerSec);
	COUNT	[3]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[4]			=	NAME_Ice_Freeze;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ThunderBall (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ThunderBall;

	visual				=	"ItSc_ThunderBall.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ChargeZap;
	
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_ChargeZap);
	
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ChargeZap;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_ChargeZap);
	
	TEXT	[2]			=	NAME_Dam_Magic_Per;
	count 	[2]			=   SPL_Damage_ChargeZap;

	TEXT	[3]			=	ConcatStrings(NAME_Zap_Living, NAME_Sec_Duration);
	COUNT	[3]			=	SPL_TIME_SHORTZAPPED;

	TEXT	[4]			=	NAME_Nonlethal;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumGol (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_SummonGolem);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_SummonGolem);

	TEXT	[2]			=	NAME_SumGol_Info;

	TEXT	[3]			=	ConcatStrings(NAME_SummonIngredient_Info, "Heart of a Golem");
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_HarmUndead (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_HarmUndead;

	visual				=	"ItSc_HarmUndead.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_DESTROYUNDEAD;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_DestroyUndead);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_DestroyUndead;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_DestroyUndead);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_DESTROYUNDEAD;
	
	TEXT	[3]			=	ConcatStrings(NAME_FatalOrHalf, NAME_MustBeUndead);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Pyrokinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Pyrokinesis;

	visual				=	"ItSc_Pyrokinesis.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PYROKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Firestorm);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Pyrokinesis;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Firestorm);
	
	TEXT	[2]			=	NAME_Dam_Magic_Per;
	count 	[2]			=   SPL_Damage_Firestorm;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;

	TEXT	[4]			=	NAME_AreaOfEffect_Small;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firestorm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firestorm;

	visual				=	"ItSc_Firestorm.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIRESTORM;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_InstantFirestorm);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_Firestorm;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_InstantFirestorm);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_INSTANTFIRESTORM;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;

	TEXT	[4]			=	NAME_AreaOfEffect_Small;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_IceWave;

	visual				=	"ItSc_IceWave.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICEWAVE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_IceWave);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceWave;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_IceWave);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_Damage_IceCube;
	
	TEXT	[3]			=	ConcatStrings(NAME_Dot_Full, NAME_DamagePerSec);
	COUNT	[3]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[4]			=	ConcatStrings(NAME_Ice_Freeze, NAME_AreaOfEffect_Default);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumDemon (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumDemon;

	visual				=	"ItSc_SumDemon.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONDEMON;
	cond_atr[2]   			=	ATR_MANA_MAX;
	cond_value[2]  			=	C_GetScrollCost(SPL_Cost_SummonDemon);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonDemon;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_SummonDemon);

	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_Duration_SummonDemon;

	TEXT	[3]			=	NAME_SumDemon_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItSc_FullHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_FullHeal;

	visual				=	"ItSc_FullHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FullHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_FullHeal);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_FullHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_FullHeal);
	
	TEXT	[2]			=	NAME_HealingPerCast;
	COUNT	[2]			=	SPL_Heal_FullHeal;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firerain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firerain;

	visual				=	"ItSc_Firerain.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIRERAIN;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	C_GetScrollCost(SPL_Cost_FireRain);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firerain;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_FireRain);
	
	//TEXT	[2]			=	NAME_Dam_Magic;
	//COUNT	[2]			=	SPL_DAMAGE_FIRERAIN;

	TEXT	[3]			=	ConcatStrings(NAME_Dot_Fire, NAME_Sec_Duration);
	COUNT	[3]			=	DOT_BURN_VFX_DURATION_S;

	TEXT	[4]			=	NAME_AreaOfEffect_Large;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_BreathOfDeath (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_BreathofDeath;

	visual				=	"ItSc_BreathOfDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_BREATHOFDEATH;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	C_GetScrollCost(SPL_Cost_BreathOfDeath);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BreathOfDeath;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_BreathOfDeath);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_BREATHOFDEATH;
	
	TEXT	[3]			=	ConcatStrings(NAME_FatalOrHalf, NAME_MustBeLiving);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_MassDeath (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Massdeath;

	visual				=	"ItSc_MassDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_MASSDEATH;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	C_GetScrollCost(SPL_Cost_MassDeath);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MassDeath;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_MassDeath);
	
	TEXT	[2]			=	NAME_Dam_Magic;
	COUNT	[2]			=	SPL_DAMAGE_MASSDEATH;
	
	TEXT	[3]			=	ConcatStrings(NAME_FatalOrHalf, NAME_MustBeLiving);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ArmyOfDarkness (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ArmyofDarkness;

	visual				=	"ItSc_ArmyOfDarkness.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ARMYOFDARKNESS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_ArmyOfDarkness);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_ArmyOfDarkness;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Manakosten_Per;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_ArmyOfDarkness);

	TEXT	[2]			=	NAME_Sec_Duration;
	COUNT	[2]			=	SPL_Duration_SummonSkeleton;
	
	TEXT	[3]			=	NAME_SumArmy_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItSc_Shrink (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Shrink;

	visual				=	"ItSc_Shrink.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SHRINK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_Shrink);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Shrink;
	
	TEXT	[0]			=	Name_MageScroll;
	
	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_Shrink);

	TEXT	[2]			=	NAME_Shrink_Penalty;
	COUNT	[2]			=	SPL_Shrink_Penalty;

	TEXT	[3]			=	NAME_Instant;

	TEXT	[4]			=	NAME_Shrink_Info;
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfSheep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfSheep;

	visual				=	"ItSc_TrfSheep.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfSheep;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	C_GetScrollCost(SPL_Cost_TrfSheep);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfSheep;

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfSheep);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfScavenger (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfScavenger;

	visual				=	"ItSc_TrfScavenger.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfScavenger;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfScavenger);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfScavenger;

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfScavenger);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfGiantRat (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfGiantrat;

	visual				=	"ItSc_TrfGiantRat.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfGiantRat;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfGiantRat);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfGiantRat;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfGiantRat);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfGiantBug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfGiantBug;

	visual				=	"ItSc_TrfGiantBug.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfGiantBug;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfGiantBug);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfGiantBug;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfGiantBug);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;

};
/*******************************************************************************************/
INSTANCE ItSc_TrfWolf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfWolf;

	visual				=	"ItSc_TrfWolf.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfWolf;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfWolf);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TrfWolf;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfWolf);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfWaran (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfWaran;

	visual				=	"ItSc_TrfWaran.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfWaran;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfWaran);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TrfWaran;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfWaran);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfSnapper (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfSnapper;

	visual				=	"ItSc_TrfSnapper.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfSnapper;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfSnapper);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= NAME_SPL_TrfSnapper;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfSnapper);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfWarg (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfWarg;

	visual				=	"ItSc_TrfWarg.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfWarg;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfWarg);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfWarg;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfWarg);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfFireWaran (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfFireWaran;

	visual				=	"ItSc_TrfFireWaran.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfFireWaran;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfFireWaran);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=  NAME_SPL_TrfFireWaran;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfFireWaran);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfLurker (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfLurker;

	visual				=	"ItSc_TrfLurker.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfLurker;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfLurker);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfLurker;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfLurker);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfShadowbeast (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfShadowbeast;

	visual				=	"ItSc_TrfShadowbeast.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfShadowbeast;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfShadowbeast);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfShadowbeast;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfShadowbeast);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfDragonSnapper (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfDragonSnapper;

	visual				=	"ItSc_TrfDragonSnapper.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfDragonSnapper;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_Cost_TrfDragonSnapper);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=  NAME_SPL_TrfDragonSnapper;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_Cost_TrfDragonSnapper);

	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/


