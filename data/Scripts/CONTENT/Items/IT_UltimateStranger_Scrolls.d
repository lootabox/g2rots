
/*******************************************************************************************/
INSTANCE ItSc_Teleport_Maya (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;

	value 				=	50;

	visual				=	"ItSc_Teleport_Maya.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Teleport_Maya;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	C_GetScrollCost(SPL_COST_TELEPORT);

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=  NAME_SPL_Teleport_Maya;
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Manakosten;
	COUNT	[1]			=	C_GetScrollCost(SPL_COST_TELEPORT);
	
	TEXT	[5]			=	NAME_Value;
	COUNT	[5]			=	value;
};
/*******************************************************************************************/