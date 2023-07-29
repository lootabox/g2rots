/*************************************************************************
**	Rockdragon Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Dragon_Rock(C_Npc)			
{
	//----- Monster ----
	name							=	"Rock Dragon";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_ROCK;
	level							=	400;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 130;
	attribute	[ATR_DEXTERITY]		= 130; //100
	attribute	[ATR_HITPOINTS_MAX]	= 600;
	attribute	[ATR_HITPOINTS]		= 600;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		= 95;
	protection	[PROT_EDGE]			= 95;
	protection	[PROT_POINT]		= 95;
	protection	[PROT_FIRE]			= 70;
	protection	[PROT_FLY]			= IMMUNE;
	protection	[PROT_MAGIC]		= 95; //70
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE|DAM_FLY; //DAM_FIRE is handled by damage script to bypass engine burn effect
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	attribute[ATR_STRENGTH];
//	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//------ Kampf-Taktik -----	
	fight_tactic	=	FAI_DRAGON;
	
	//------ Senses & Ranges ----	
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


//****************
//	Visuals
//****************

func void B_SetVisuals_Dragon_Rock()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Rock_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//****************
//	Rockdragon    
//****************

INSTANCE Dragon_Rock	(Mst_Default_Dragon_Rock)
{
	name				=	"Pedrakhan";
	flags				   			= 	NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Rock();
	Npc_SetToFistMode(self);
};
