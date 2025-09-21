// **************
// ZS_MagicShrink
// **************

func int ZS_MagicShrink()
{
	if ( !Npc_HasBodyFlag( self, BS_FLAG_INTERRUPTABLE) )
	{
		AI_StandUp 		(self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	
	self.aivar[AIV_MM_ShrinkState] = 0;   		 // AIV resetten
};


func int ZS_MagicShrink_Loop ()
{	
	if 		(self.aivar[AIV_MM_ShrinkState] < SPL_Shrink_Size)
	{	
		var C_NPC slf; slf = Hlp_getNpc(self);
		if (Hlp_IsValidNpc(self))
		{
			var int slfPtr; slfPtr = _@(slf);
			var oCNpc slfOC; slfOC = _^(slfPtr);
			var FLOAT newScale; newScale = castFromIntf(subf(slfOC.model_scale[0], 1008981770)); //0.01
			Mdl_SetModelScale(self, newScale, newScale, newScale);
		};
		self.aivar[AIV_MM_ShrinkState] += 1;
	}
	else if (self.aivar[AIV_MM_ShrinkState] == SPL_Shrink_Size)
	{
		//-------- Attribute reduzieren ! --------
		if (self.attribute[ATR_HITPOINTS] * SPL_Shrink_Penalty >= 100)
		{
			Npc_ChangeAttribute (self,ATR_HITPOINTS,	-(self.attribute[ATR_HITPOINTS]			* SPL_Shrink_Penalty / 100));
		};
		Npc_ChangeAttribute (self,ATR_HITPOINTS_MAX,	-(self.attribute[ATR_HITPOINTS_MAX]		* SPL_Shrink_Penalty / 100));
		Npc_ChangeAttribute (self,ATR_STRENGTH,			-(self.attribute[ATR_STRENGTH]			* SPL_Shrink_Penalty / 100));
		Npc_ChangeAttribute (self,ATR_DEXTERITY,		-(self.attribute[ATR_DEXTERITY]			* SPL_Shrink_Penalty / 100));
		if (self.protection[PROT_BLUNT] > 0)	{ self.protection[PROT_BLUNT]	=	self.protection[PROT_BLUNT]	* (100 - SPL_Shrink_Penalty) / 100; };
		if (self.protection[PROT_EDGE] > 0)		{ self.protection[PROT_EDGE]	=	self.protection[PROT_EDGE]	* (100 - SPL_Shrink_Penalty) / 100; };
		if (self.protection[PROT_FIRE] > 0)		{ self.protection[PROT_FIRE]	=	self.protection[PROT_FIRE]	* (100 - SPL_Shrink_Penalty) / 100; };
		if (self.protection[PROT_FLY] > 0)		{ self.protection[PROT_FLY]		=	self.protection[PROT_FLY]	* (100 - SPL_Shrink_Penalty) / 100; };
		if (self.protection[PROT_MAGIC] > 0)	{ self.protection[PROT_MAGIC]	=	self.protection[PROT_MAGIC]	* (100 - SPL_Shrink_Penalty) / 100; };
		if (self.protection[PROT_POINT] > 0)	{ self.protection[PROT_POINT]	=	self.protection[PROT_POINT]	* (100 - SPL_Shrink_Penalty) / 100; };

		if (self.damagetype & DAM_FLY)
		{
			self.damagetype = ~DAM_FLY & self.damagetype;
		};
		
		self.aivar[AIV_MM_ShrinkState] = SPL_Shrink_Size + 1;
	}
	else if (self.aivar[AIV_MM_ShrinkState] == SPL_Shrink_Size + 1)
	{
		Npc_ClearAIQueue(self);
		/* self.start_aistate = ZS_MagicShrunk;
		AI_StartState		(self,	ZS_MagicShrunk,	1,	""); */
		return				LOOP_END;	 
	};

	var float waittime; waittime = castFromIntf(divf(mkf(SPL_Shrink_Duration), mkf(SPL_Shrink_Size)));
	AI_Wait					(self, waittime);

	return					LOOP_CONTINUE;
};

func void ZS_MagicShrink_End()
{

};


// **************
// ZS_MagicShrunk
// **************

func void ZS_MagicShrunk ()
{	
	Npc_SetTarget			(self,	hero);
};

func int ZS_MagicShrunk_Loop ()
{
	AI_Flee					(self);
	return					LOOP_CONTINUE;
};

func void ZS_MagicShrunk_End ()
{	
	
};


