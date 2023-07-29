
/******************************************************************************************/

const int Am_Hp_T1			= 40;		const int Am_Regen_T1		= 50;
const int Am_Hp_T2			= 60;		const int Am_Regen_T2		= 100;

const int Am_Atr_T1			= 8;		const int Am_Prot_T1		= 5;
const int Am_Atr_T2			= 12;		const int Am_Prot_T2		= 10;

/******************************************************************************************/

const int Ri_Hp_T1			= 20;		const int Ri_Regen_T1		= 50;
const int Ri_Hp_T2			= 40;		const int Ri_Regen_T2		= 100;

const int Ri_Atr_T1			= 4;		const int Ri_Prot_T1		= 5;
const int Ri_Atr_T2			= 8;		//const int Ri_Prot_T2		= 10;

/******************************************************************************************/

const int Be_Hp_T1			= 20;		const int Be_Regen_T1			= 50;

const int Be_Atr_T1			= 4;		const int Be_Prot_T1		= 5;

/******************************************************************************************/
	PROTOTYPE ItAm_Prototype(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_WEAKGLIMMER"; //effect			=	"SPELLFX_ITEMGLIMMER";

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
};
/******************************************************************************************/
	PROTOTYPE ItRi_Prototype(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	wear					= 	WEAR_EFFECT;
	effect					=	"SPELLFX_WEAKGLIMMER"; //effect			=	"SPELLFX_ITEMGLIMMER";

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
};
/******************************************************************************************/
	PROTOTYPE  ItBe_Prototype (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_WEAKGLIMMER";

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
};
/******************************************************************************************/
