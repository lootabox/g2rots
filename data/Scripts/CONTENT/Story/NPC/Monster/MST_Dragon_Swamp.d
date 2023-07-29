//***************************
//	Swampdragon Prototype	
//***************************

PROTOTYPE Mst_Default_Dragon_Swamp(C_Npc)			
{
	//----- Monster ----
	name							=	"Swamp Dragon";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_SWAMP;
	level							=	350;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 120;
	attribute	[ATR_DEXTERITY]		= 120; //100
	attribute	[ATR_HITPOINTS_MAX]	= 500;
	attribute	[ATR_HITPOINTS]		= 500;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		= 90;
	protection	[PROT_EDGE]			= 90;
	protection	[PROT_POINT]		= 90;
	protection	[PROT_FIRE]			= 60;
	protection	[PROT_FLY]			= IMMUNE;
	protection	[PROT_MAGIC]		= 90; //60
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE|DAM_FLY; //DAM_FIRE is handled by damage script to bypass engine burn effect
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	attribute[ATR_STRENGTH];
//	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	aivar[AIV_MaxDistToWp]			= 1000;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Dragon_Swamp()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Swamp_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Swampdragon	
//*****************
INSTANCE Dragon_Swamp	(Mst_Default_Dragon_Swamp)
{
	name		=	"Pandrodor";
	flags				   			= 	NPC_FLAG_IMMORTAL;
	fight_tactic	=	FAI_DRAGON;
	B_SetVisuals_Dragon_Swamp();
	Npc_SetToFistMode(self);
	bodyStateInterruptableOverride = TRUE;
};
