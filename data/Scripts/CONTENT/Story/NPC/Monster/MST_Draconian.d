//************************
//	Drakonian Prototype
//************************

PROTOTYPE Mst_Default_Draconian(C_Npc)			
{
	//----- Monster ----
	name							=	"Lizard Man";
	guild							=	GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRACONIAN;
	level							=	35;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	45;
	protection	[PROT_POINT]		=	45;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	45; //15
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 80;
	HitChance	[NPC_TALENT_2H]			= 80;
	HitChance	[NPC_TALENT_BOW]		= 80;
	HitChance	[NPC_TALENT_CROSSBOW]	= 80;
	
	//----- Damage Types ----
	damagetype 						=	DAM_POINT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_ORC;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Draconian()
{
	Mdl_SetVisual			(self,	"Draconian.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Draconian_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Drakonier    
//**************

INSTANCE Draconian			(Mst_Default_Draconian)
{
	// ------ visuals ------
	B_SetVisuals_Draconian();
	
	//-------- inventory --------
	//EquipItem (self, ItMw_2H_OrcSword_01);
	EquipItem (self, ItMw_2H_OrcMace_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
