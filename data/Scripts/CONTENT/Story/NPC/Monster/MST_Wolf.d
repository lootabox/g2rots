//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Wolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	6;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	10; //0

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};


//************
//	Visuals
//************


func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_BLACKWOLF()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Warg_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//************
//	Wolf    	
//************

INSTANCE Wolf	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
};

//**********************************************
//	Schwarzer Wolf  (MIS)
//*********************************************

INSTANCE BlackWolf	(Mst_Default_Wolf)
{
	name							=	"Black Wolf";
	level							=	 8; //6
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	20; //15
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15; //12
	protection	[PROT_EDGE]			=	15; //12
	protection	[PROT_POINT]		=	15; //12
	protection	[PROT_FIRE]			=	0; //12
	protection	[PROT_FLY]			=	15; //12
	protection	[PROT_MAGIC]		=	15; //12
	
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
};

//*****************
//	Summoned Wolf    	
//*****************

INSTANCE Summoned_Wolf	(Mst_Default_Wolf)
{
	name							=	"Summoned Wolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0;
	aivar[AIV_SummonTime]			= 	SPL_Duration_SummonWolf;
	if (MageStaff_Normal_2H_03_Equipped) {
		aivar[AIV_SummonTime] += SPL_Duration_SummonWolf;
	};
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	
	Wld_PlayEffect("spellFX_SummonCreature_ORIGIN", self, self, 0, 0, 0, FALSE);
};

INSTANCE Summoned_BlackWolf	(Mst_Default_Wolf)
{
	name							=	"Summoned Black Wolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0;
	aivar[AIV_SummonTime]			= 	SPL_Duration_SummonWolf;
	if (MageStaff_Normal_2H_03_Equipped) {
		aivar[AIV_SummonTime] += SPL_Duration_SummonWolf;
	};
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	
	Wld_PlayEffect("spellFX_SummonCreature_ORIGIN", self, self, 0, 0, 0, FALSE);
};

//************
//	YWolf    	
//************

INSTANCE YWolf	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Young Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10; //5
	attribute	[ATR_DEXTERITY]		=	10; //5
	attribute	[ATR_HITPOINTS_MAX]	=	20; //20
	attribute	[ATR_HITPOINTS]		=	20; //20
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5; //0
	protection	[PROT_EDGE]			=	5; //0
	protection	[PROT_POINT]		=	5; //0
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	5; //0
	protection	[PROT_MAGIC]		=	5; //0
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};



//************
//	Missions Wölfe für Pepe: YWolf    	
//************


INSTANCE PEPES_YWolf1	(Mst_Default_Wolf)
{
	name							=	"Young Wolf";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20; //20
	attribute	[ATR_HITPOINTS]		=	20; //20
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0; //5
	protection	[PROT_FLY]			=	5; //0
	protection	[PROT_MAGIC]		=	5; //0
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};


INSTANCE PEPES_YWolf2	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Young Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20; //20
	attribute	[ATR_HITPOINTS]		=	20; //20
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0; //5
	protection	[PROT_FLY]			=	5; //0
	protection	[PROT_MAGIC]		=	5; //0
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};


INSTANCE PEPES_YWolf3	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Young Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20; //20
	attribute	[ATR_HITPOINTS]		=	20; //20
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0; //5
	protection	[PROT_FLY]			=	5; //0
	protection	[PROT_MAGIC]		=	5; //0
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};


INSTANCE PEPES_YWolf4	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Young Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20; //20
	attribute	[ATR_HITPOINTS]		=	20; //20
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0; //5
	protection	[PROT_FLY]			=	5; //0
	protection	[PROT_MAGIC]		=	5; //0
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	//CreateInvItems (self, ItFoMuttonRaw, 1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};

instance WolfTransform(Mst_Default_Wolf)
{
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_TransformStop);
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};
