
INSTANCE ITAR_DHT (C_Item)
{
	name 					=	"ITAR_DHT";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	20;

	value 					=	VALUE_ITAR_DJG_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3ds";
	visual_change 			=	"Armor_DHT.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_DJG_Crawler;
	on_unequip				=	UnEquip_ITAR_DJG_Crawler;
	
	description				=	name;
		
	TEXT[2]					=	NAME_Prot_Edge;			
	COUNT[2]				= 	protection	[PROT_EDGE];
	
	TEXT[1]					=	NAME_Prot_Point;		
	COUNT[1]				= 	protection	[PROT_POINT];
	
	TEXT[4] 				=	NAME_Prot_Fire;			
	COUNT[4]				= 	protection	[PROT_FIRE];
	
	TEXT[3]					=	NAME_Prot_Magic;		
	COUNT[3]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
