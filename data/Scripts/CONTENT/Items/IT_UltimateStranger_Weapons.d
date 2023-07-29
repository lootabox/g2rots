
// *****************************************************
INSTANCE ItMw_1h_Broadsword (C_Item)
{	
	name 				=	"Broadsword";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Broadsword;

	damageTotal  		= 	Damage_Broadsword;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Broadsword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Broadsword;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Dam_Edge;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_FineBroadsword (C_Item)
{	
	name 				=	"Fine Broadsword";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_FineBroadsword;

	damageTotal			= 	Damage_FineBroadsword;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_FineBroadsword;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_FineBroadsword;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Dam_Edge;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2H_OrcMace_01 (C_Item)
{	
	name 				=	"Krush Karrok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Orkmace_01;

	damageTotal			= 	Damage_Orkmace_01;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Orkmace_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkmace_01;
	visual 				=	"ItMw_2H_OrcMace_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
PROTOTYPE ItMw_MageStaff_Prototype (C_Item)
{
	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE;
	material			=	MAT_WOOD;

	damagetype			=	DAM_BLUNT;
	range				=	RANGE_MageStaff;
	mag_circle			=	1;

	cond_atr[2]			=	ATR_MANA_MAX;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Blades_2H_01 (ItMw_MageStaff_Prototype)
{
	name				=	"Typhoon";
	description			=	name;
	value				=	Value_MageStaff_Blades_2H_01;
	damageTotal			=	Damage_MageStaff_Blades_2H_01;
	cond_value[2]		=	Condition_MageStaff_Blades_2H_01;
	//mag_circle			=	3;
	visual 				=	"ItMW_MageStaff_Blades_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	
	on_equip			=	Equip_MageStaff_Blades_2H_01;
	on_unequip			=	UnEquip_MageStaff_Blades_2H_01;

	TEXT[0]				= NAME_Bonus_MageStaff_Blades_2H_01;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Blades_2H_01() {
	MageStaff_Blades_2H_01_Equipped = TRUE;
	spellFxAniLetters[SPL_Firebolt] = "RPF";
	spellFxAniLetters[SPL_IceLance] = "RPF";
	spellFxAniLetters[SPL_Icebolt] = "RPF";
	spellFxAniLetters[SPL_InstantFireball] = "RPF";
	spellFxAniLetters[SPL_Zap] = "RPF";
};
FUNC VOID UnEquip_MageStaff_Blades_2H_01() {
	MageStaff_Blades_2H_01_Equipped = FALSE;
	// Deactive timer if active
	if (FF_Active(FF_RapidSpellCombo_Reset)) {
		FF_Remove(FF_RapidSpellCombo_Reset);
	};
	spellFxAniLetters[SPL_Firebolt] = "FBT";
	spellFxAniLetters[SPL_IceLance] = "FBT";
	spellFxAniLetters[SPL_Icebolt] = "FBT";
	spellFxAniLetters[SPL_InstantFireball] = "FBT";
	spellFxAniLetters[SPL_Zap] = "FBT";
};
// *****************************************************
INSTANCE ItMw_MageStaff_Blades_2H_02 (ItMw_MageStaff_Prototype)
{
	name				=	"Tsunami";
	description			=	name;
	value				=	Value_MageStaff_Blades_2H_02;
	damageTotal			=	Damage_MageStaff_Blades_2H_02;
	cond_value[2]		=	Condition_MageStaff_Blades_2H_02;
	//mag_circle			=	3;
	visual 				=	"ItMW_MageStaff_Blades_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";

	on_equip			=	Equip_MageStaff_Blades_2H_02;
	on_unequip			=	UnEquip_MageStaff_Blades_2H_02;

	TEXT[0]				= NAME_Bonus_MageStaff_Blades_2H_02;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Blades_2H_02() {
	MageStaff_Blades_2H_02_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Blades_2H_02() {
	MageStaff_Blades_2H_02_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Blades_2H_03 (ItMw_MageStaff_Prototype)
{
	name				=	"Thunder";
	description			=	name;
	value				=	Value_MageStaff_Blades_2H_03;
	damageTotal			=	Damage_MageStaff_Blades_2H_03;
	cond_value[2]		=	Condition_MageStaff_Blades_2H_03;
	//mag_circle			=	3;
	visual 				=	"ItMW_MageStaff_Blades_2H_03.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";

	on_equip			=	Equip_MageStaff_Blades_2H_03;
	on_unequip			=	UnEquip_MageStaff_Blades_2H_03;

	TEXT[0]				= NAME_Bonus_MageStaff_Blades_2H_03;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Blades_2H_03() {
	MageStaff_Blades_2H_03_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Blades_2H_03() {
	MageStaff_Blades_2H_03_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Good_2H_01 (ItMw_MageStaff_Prototype)
{
	name				=	"Ulthar's staff";
	description			=	name;
	value				=	Value_MageStaff_Good_2H_01;
	damageTotal			=	Damage_MageStaff_Good_2H_01;
	cond_value[2]		=	Condition_MageStaff_Good_2H_01;
	//mag_circle			=	5;
	visual 				=	"ItMW_MageStaff_Good_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	on_equip			=	Equip_MageStaff_Good_2H_01;
	on_unequip			=	UnEquip_MageStaff_Good_2H_01;

	TEXT[0]				= NAME_Bonus_MageStaff_Good_2H_01;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Good_2H_01() {
	MageStaff_Good_2H_01_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Good_2H_01() {
	MageStaff_Good_2H_01_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Good_2H_02 (ItMw_MageStaff_Prototype)
{
	name				=	"Staff of Ice";
	description			=	name;
	value				=	Value_MageStaff_Good_2H_02;
	damageTotal			=	Damage_MageStaff_Good_2H_02;
	cond_value[2]		=	Condition_MageStaff_Good_2H_02;
	//mag_circle			=	3;
	visual 				=	"ItMW_MageStaff_Good_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";

	on_equip			=	Equip_MageStaff_Good_2H_02;
	on_unequip			=	UnEquip_MageStaff_Good_2H_02;

	TEXT[0]				= NAME_Bonus_MageStaff_Good_2H_02;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Good_2H_02() {
	MageStaff_Good_2H_02_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Good_2H_02() {
	MageStaff_Good_2H_02_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Good_2H_03 (ItMw_MageStaff_Prototype)
{
	name				=	"Staff of Fire";
	description			=	name;
	value				=	Value_MageStaff_Good_2H_03;
	damageTotal			=	Damage_MageStaff_Good_2H_03;
	cond_value[2]		=	Condition_MageStaff_Good_2H_03;
	//mag_circle			=	3;
	visual 				=	"ItMW_MageStaff_Good_2H_03.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	
	on_equip			=	Equip_MageStaff_Good_2H_03;
	on_unequip			=	UnEquip_MageStaff_Good_2H_03;

	TEXT[0]				= NAME_Bonus_MageStaff_Good_2H_03;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Good_2H_03() {
	MageStaff_Good_2H_03_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Good_2H_03() {
	MageStaff_Good_2H_03_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Normal_2H_01 (ItMw_MageStaff_Prototype)
{
	name				=	"Staff of Thunder";
	description			=	name;
	value				=	Value_MageStaff_Normal_2H_01;
	damageTotal			=	Damage_MageStaff_Normal_2H_01;
	cond_value[2]		=	Condition_MageStaff_Normal_2H_01;
	//mag_circle			=	2;
	visual 				=	"ItMW_MageStaff_Normal_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	
	on_equip			=	Equip_MageStaff_Normal_2H_01;
	on_unequip			=	UnEquip_MageStaff_Normal_2H_01;

	TEXT[0]				= NAME_Bonus_MageStaff_Normal_2H_01;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Normal_2H_01() {
	MageStaff_Normal_2H_01_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Normal_2H_01() {
	MageStaff_Normal_2H_01_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Normal_2H_02 (ItMw_MageStaff_Prototype)
{
	name				=	"Magic staff";
	description			=	name;
	value				=	Value_MageStaff_Normal_2H_02;
	damageTotal			=	Damage_MageStaff_Normal_2H_02;
	cond_value[2]		=	Condition_MageStaff_Normal_2H_02;
	//mag_circle			=	1;
	visual 				=	"ItMW_MageStaff_Normal_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	
	on_equip			=	Equip_MageStaff_Normal_2H_02;
	on_unequip			=	UnEquip_MageStaff_Normal_2H_02;

	TEXT[0]				= NAME_Bonus_MageStaff_Normal_2H_02;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Normal_2H_02() {
	MageStaff_Normal_2H_02_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Normal_2H_02() {
	MageStaff_Normal_2H_02_Equipped = FALSE;
};
// *****************************************************
INSTANCE ItMw_MageStaff_Normal_2H_03 (ItMw_MageStaff_Prototype)
{
	name				=	"Summoning staff";
	description			=	name;
	value				=	Value_MageStaff_Normal_2H_03;
	damageTotal			=	Damage_MageStaff_Normal_2H_03;
	cond_value[2]		=	Condition_MageStaff_Normal_2H_03;
	//mag_circle			=	2;
	visual 				=	"ItMW_MageStaff_Normal_2H_03.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";
	
	on_equip			=	Equip_MageStaff_Normal_2H_03;
	on_unequip			=	UnEquip_MageStaff_Normal_2H_03;

	TEXT[0]				= NAME_Bonus_MageStaff_Normal_2H_03;
	TEXT[1]				= NAME_Dam_Blunt;				COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Mana_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Reach;					COUNT[3]	= range*100/253;
	TEXT[4]				= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_MageStaff_Normal_2H_03() {
	MageStaff_Normal_2H_03_Equipped = TRUE;
};
FUNC VOID UnEquip_MageStaff_Normal_2H_03() {
	MageStaff_Normal_2H_03_Equipped = FALSE;
};
// *****************************************************
