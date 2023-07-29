//***************************
//	Swampgolem Prototype			
//***************************

PROTOTYPE Mst_Default_Addon_SwampGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Swamp Golem";
	guild							=	GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SWAMPGOLEM;
	level							=	16;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 80;
	attribute	[ATR_DEXTERITY]		= 80;
	attribute	[ATR_HITPOINTS_MAX]	= 190;
	attribute	[ATR_HITPOINTS]		= 190;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 60;
	protection	[PROT_EDGE]			= 30;
	protection	[PROT_POINT]		= IMMUNE;
	protection	[PROT_FIRE]			= 60;
	protection	[PROT_FLY]			= IMMUNE;
	protection	[PROT_MAGIC]		= 50;
	
	//---- Damage Types ----
	damagetype 						=	DAM_EDGE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//-------------------------------------------------------------
func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Sumpf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Swampgolem
//******************

INSTANCE SwampGolem	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

//******************
//	SwampGolem_Valley
//******************

INSTANCE SwampGolem_Valley	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	aivar[AIV_MaxDistToWp]			= 1500;
	aivar[AIV_OriginalFightTactic] 	= FAI_STONEGOLEM;
};

