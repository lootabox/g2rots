
const int Value_Dragonegg 		= 200;//Joly: nicht ändern
const int Value_OrcEliteRing 	= 130;//Joly: nicht ändern
/******************************************************************************************/
// Angars Amulett
/******************************************************************************************/
	INSTANCE  ItAm_Mana_Angar_MIS(ItAm_Prototype)
{
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	Value_Am_Mana;

	visual 			=	"ItAm_Mana_01.3ds";

	on_equip		=	Equip_ItAm_Mana_01;
	on_unequip		=	UnEquip_ItAm_Mana_01;

	description		= "Angar's Amulet of Magic";
	
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= Am_Mana;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};
	
//**************************************************************
//	Ferros Schwert
//**************************************************************

INSTANCE ItMW_1H_FerrosSword_Mis (C_Item) 
{	
	name 				=	"Feros' Broadsword";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	Value_FineBroadsword;

	damageTotal			= 	Damage_FineBroadsword;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_FineBroadsword;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_FineBroadsword;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Dam_Edge;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_KerolothsGeldbeutel_MIS(C_Item)
{
	name 				=	"Keroloth's Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseKerolothsGeldbeutel;
	description			= 	name;
	TEXT[2]				= 	"This satchel seems to be full of gold coins.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseKerolothsGeldbeutel ()
{
	CreateInvItems (self,ItMi_Gold,300);	
	CreateInvItems (self,ItMi_KerolothsGeldbeutelLeer_MIS,1);	
	Print 	(PRINT_KerolothsGeldBeutel);
	Snd_Play ("Geldbeutel");
};

INSTANCE ItMi_KerolothsGeldbeutelLeer_MIS(C_Item)
{
	name 				=	"Keroloth's Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	//scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	//on_state[0]		=   UseKerolothsGeldbeutel;
	description			= 	name;
	TEXT[2]				= 	"The satchel is empty now.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItRw_SengrathsArmbrust_MIS(C_Item)
{
	name 				=	"Sengrath's Crossbow";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_MilArmbrust;

	damageTotal			= 	Damage_MilArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_MilArmbrust;
	visual 				=	"ItRw_Mil_Crossbow.mms";

	description			= name;
	TEXT[2]				= NAME_Dam_Point;				COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


//Tabins Lurkerhäute von Engrom

INSTANCE ItAt_TalbinsLurkerSkin (C_Item)
{
	name 				=	"Lurker Skin";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_ReptileSkin;

//	visual 				=	"ItAt_LurkerSkin.3DS";
	visual 				=	"ItAt_TalbinsLurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"The name Talbin's been branded on the inside.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	Drachen-Ei	(für DJG only Ambient auftrag)
//---------------------------------------------------------------------
INSTANCE ItAt_DragonEgg_MIS	(C_ITEM)
{	
	name 					=	"Dragon Egg";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	Value_Dragonegg;

	visual 					=	"ItAt_DragonEgg.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"The egg is warm, and there's a scratching noise on the inside.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	OrcEliteRing (für PAL only Ambient auftrag)
//---------------------------------------------------------------------

INSTANCE ItRi_OrcEliteRing(ItRi_Prototype)
{
	flags 					=	ITEM_MISSION|ITEM_RING|ITEM_MULTI; //Joly: Muß so bleiben, sonst XP und Gold Exploit (Lord Hagen die Dinger bringen!)

	value 					=	Value_OrcEliteRing;

//	visual 					=	"ItRi_Str_02.3ds";
	visual 					=	"ItRi_OrcEliteRing.3ds";

	on_equip				=	Equip_OrcEliteRing;
	on_unequip				=	UnEquip_OrcEliteRing;

	description				= 	"Ring of the Orcish Warlords";

	TEXT[0]					=	"The ring is rough and seems strangely cold.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID Equip_OrcEliteRing ()
	{
		Npc_ChangeAttribute  (self, ATR_STRENGTH, - 20);
		Print	(PRINT_OrcEliteRingEquip);
	};

	FUNC VOID UnEquip_OrcEliteRing()
	{
		Npc_ChangeAttribute	 (self,	ATR_STRENGTH, + 20);
	};

/******************************************************************************************/	

var int Neoras_SCUsedDragonEggDrink;
INSTANCE ItPo_DragonEggDrinkNeoras_MIS (C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpElixier;	

//	visual 			=	"ItPo_Perm_STR.3ds";
	visual 			=	"ItPo_Special_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_DragonEggDrinkNeoras;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Potion of Dragon Egg Secretion";
	
	TEXT[3]			= 	"Effects unknown.";				
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID Use_DragonEggDrinkNeoras()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Elixier);
		B_RaiseAttribute (self, ATR_STRENGTH, + 3);
		Snd_Play ("DEM_Warn");
		Neoras_SCUsedDragonEggDrink = TRUE;
	};


//////////////////////////////////////////////////////////////////////////////
//
//	MAP Der Orcelite
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Orcelite_MIS (C_Item)
{
	name 		= "Orcish War Map";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	//visual 		= "ItWr_Map_01.3DS";
	visual 		= "ItWr_Map_NW_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Orcelite_MIS;

	description	= name;
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};
var int Use_Map_NewWorld_Orcelite_MIS_OneTime;
	func void Use_Map_NewWorld_Orcelite_MIS()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_Orcelite_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_Orcelite.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	
		if (Use_Map_NewWorld_Orcelite_MIS_OneTime == FALSE)
		&& (MIS_KillOrkOberst != 0)
		{
			B_LogEntry (TOPIC_OrcElite,"I found a strange map on the orcish colonel. It looks like the orcs' strategic war map."); 
			Use_Map_NewWorld_Orcelite_MIS_OneTime = TRUE;
		};
	};
	
//////////////////////////////////////////////////////////////////////////////
//
//	Caves Map
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Caves_MIS (C_Item)
{
	name 		= "The Caves of Khorinis";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 200;

	//visual 		= "ItWr_Map_01.3DS";
	visual 		= "ItWr_Map_NW_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Caves_MIS;

	description	= name;
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

	func void Use_Map_NewWorld_Caves_MIS()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_Caves_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_Caves.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};
