//***************************
//	Stonegolem Prototype			
//***************************

PROTOTYPE Mst_Default_StoneGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Stone Golem";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	18;
	
	bodyStateInterruptableOverride	=	TRUE;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100; //120
	attribute	[ATR_DEXTERITY]		=	100; //120
	attribute	[ATR_HITPOINTS_MAX]	=	256;
	attribute	[ATR_HITPOINTS]		=	256;
	attribute	[ATR_MANA_MAX] 		=	0; //100
	attribute	[ATR_MANA] 			=	0; //100
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	IMMUNE; //1000
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	IMMUNE; //1000
	protection	[PROT_MAGIC]		=	60;
	
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
func void B_SetVisuals_StoneGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Stone Golem   	
//******************

INSTANCE StoneGolem	(Mst_Default_StoneGolem)
{
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
};


//###########################
//##
//##	Shattered Golem
//##
//###########################

//**************
//ZS_GolemDown
//**************

func void ZS_GolemDown ()
{
	self.senses			=	SENSE_SMELL ;
	self.senses_range	=	2000;	
	Npc_SetPercTime		(self, 1);	
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER	, 	B_GolemRise	); 

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
		
func int ZS_GolemDown_LOOP ()	
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
  	{
  		AI_PlayAni (self,"T_DEAD");
  		self.aivar[AIV_TAPOSITION] = ISINPOS;
  	};
	return LOOP_CONTINUE;
};

func void ZS_GolemDown_END()
{
	
};

func void B_GolemRise ()
{
	if (Npc_GetDistToNpc (self,hero) <= 900)
	&& (Mob_HasItems ("NW_GOLEMCHEST",ItSe_GolemChest_Mis) == 0)
	{
		AI_PlayAni (self,"T_RISE");
		self.NoFocus	= FALSE;
		self.name			=	"Stone Golem";
		self.flags				   			= 	0;
		
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		//self.bodyStateInterruptableOverride 	= FALSE;
		self.start_aistate				= ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	};
		
};

//************************************************************************************
//	Shattered_Golem ->liegt am Boden und setzt sich bei Annäherung des Hero zusammen
//************************************************************************************

INSTANCE Shattered_Golem (Mst_Default_StoneGolem)
{
	name							=	"";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	18;
	
	NoFocus	= TRUE;
	
	flags				   			= 	NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
	
	start_aistate				= ZS_GolemDown;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//##################################################
//##
//##	Magischer Golem   	für Prüfung des Feuers
//##
//##################################################

INSTANCE MagicGolem	(Mst_Default_StoneGolem)
{
	name							=	"Magic Golem";
	//Level
	level							=	10;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	IMMUNE;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	IMMUNE;
	protection	[PROT_FLY]			=	IMMUNE;	
	protection	[PROT_MAGIC]		=	IMMUNE;
	
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
};
