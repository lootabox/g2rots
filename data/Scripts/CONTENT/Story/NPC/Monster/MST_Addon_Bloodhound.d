/*************************************************************************
**	Bloodhound Prototype	(Anims wie Shadowbeast)						**
*************************************************************************/

PROTOTYPE Mst_Default_Bloodhound(C_Npc)			
{
	name							=	"Bloodhound";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_Bloodhound;
	level							=	18;
//----------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------------
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	30;
//----------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-------------------------------------------------------------
//-------------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//-------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

//	aivar[AIV_MM_Behaviour]		= HUNTER;
	
//	aivar[AIV_MM_PercRange]		= 2500;
//	aivar[AIV_MM_DrohRange]		= 2000;
//	aivar[AIV_MM_AttackRange]	= 1800;
//	aivar[AIV_MM_DrohTime]		= 2;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Bloodhound_Visuals()
{
	Mdl_SetVisual			(self,	"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Bhd_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Bloodhound    															**
*************************************************************************/

INSTANCE Bloodhound	(Mst_Default_Bloodhound)
{
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};