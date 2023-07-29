//*************************
//	Fire Waran Prototype  
//*************************

PROTOTYPE Mst_Default_FireWaran(C_Npc)			
{
	//----- Monster ----
	name							=	"Fire Lizard";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_FIREWARAN;
	level							=	21;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80; //100
	attribute	[ATR_HITPOINTS_MAX]	=	210;
	attribute	[ATR_HITPOINTS]		=	210;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	40; //0
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE; //DAM_FIRE is handled by damage script to bypass engine burn effect
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	attribute[ATR_STRENGTH];
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//***********
//	Visuals
//***********

func void B_Setvisuals_FireWaran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	Mdl_ApplyOverlayMds 	(self,	"Firewaran.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Fire Waran    	
//*****************

INSTANCE FireWaran	(Mst_Default_FireWaran)
{
	B_SetVisuals_FireWaran();
	Npc_SetToFistMode(self);
};

instance FireWaranTransform(Mst_Default_FireWaran)
{
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_TransformStop);
	B_SetVisuals_FireWaran();
	Npc_SetToFistMode(self);
};
