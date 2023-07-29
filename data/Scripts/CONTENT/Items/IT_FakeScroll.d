INSTANCE Fakescroll(C_Item)
{	
	name 					=	"Letter";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;
	value 					=	0;

	visual 					=	"Fakescroll.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	
	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

INSTANCE Fakeheroface(C_Item)
{
	name = "Wanted Note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

INSTANCE Fakemap(C_Item)
{
	name = "Map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};
