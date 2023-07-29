//***************************
//	Undeaddragon Prototype	
//***************************

PROTOTYPE Mst_Default_Dragon_Undead(C_Npc)			
{
	//----- Monster ----
	name							=	"Undead Dragon";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_UNDEAD;
	level							=	1000;
	
	bodyStateInterruptableOverride 	= 	TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 170;
	attribute	[ATR_DEXTERITY]		= 170;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 150;
	protection	[PROT_EDGE]			= 150;
	protection	[PROT_POINT]		= 150;
	protection	[PROT_FIRE]			= 150;
	protection	[PROT_FLY]			= IMMUNE;
	protection	[PROT_MAGIC]		= 150;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE|DAM_FLY; //DAM_FIRE is handled by damage script to bypass engine burn effect
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	attribute[ATR_STRENGTH];
//	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_DRAGON;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= 1000;
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

func void B_SetVisuals_Dragon_Undead()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Undead_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Undeaddragon	
//*****************
INSTANCE Dragon_Undead	(Mst_Default_Dragon_Undead)
{
	B_SetVisuals_Dragon_Undead();
	flags				   			= 	NPC_FLAG_IMMORTAL;
	effect							=	"spellfx_undead_dragon";
	Npc_SetToFistMode(self);
};
