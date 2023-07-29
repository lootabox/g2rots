

//#####################################################################
//##
//##
//##				TALBIN_NW
//##
//##
//#####################################################################
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_NW_EXIT   (C_INFO)
{
	npc         = VLK_4132_Talbin_NW;
	nr          = 999;
	condition   = DIA_Talbin_NW_EXIT_Condition;
	information = DIA_Talbin_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Moving through pass
///////////////////////////////////////////////////////////////////////

instance DIA_Talbin_NW_MOVING (C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 1;
	condition = DIA_Talbin_NW_MOVING_Condition;
	information = DIA_Talbin_NW_MOVING_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Talbin_NW_MOVING_Condition()
{
	if (Npc_GetDistToWP(self,"NW_GREATPEASENT_TO_PASS") > 2100)
	&& (TOPIC_END_Talbin_Runs == FALSE)
	&& (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_MOVING_Info()
{
	AI_Output			(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //Thank you. When you cross, I'll simply follow you.
	AI_StopProcessInfos(self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW		(C_INFO)
{
	npc = VLK_4132_Talbin_NW;
	nr = 1;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	permanent = FALSE;
	important = TRUE;
	//description	 = 	"The pass wasn't all that bad, was it?";
};

func int DIA_Talbin_NW_Condition ()
{
	if(Npc_GetDistToWP(self,"NW_GREATPEASENT_TO_PASS") <= 2100)
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_Info ()
{
	AI_Output			(self, other, "DIA_Talbin_NW_07_01"); //Thanks for rescuing me.
	AI_Output			(other, self, "DIA_Talbin_NW_15_00"); //The pass wasn't all that bad, was it?
	AI_Output			(self, other, "DIA_Talbin_NW_07_02"); //Here. I found this raw stone on the pass. I think it may be of use to you.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Talbin_NW_07_03"); //I assume it's a runestone.
		CreateInvItems (self, ItMi_RuneBlank, 1);
		B_GiveInvItems (self, other, ItMi_RuneBlank, 1);
	}
	else
	{
		AI_Output			(self, other, "DIA_Talbin_NW_07_04"); //I assume it's a piece of ore.
		CreateInvItems (self, ItMi_Nugget, 1);
		B_GiveInvItems (self, other, ItMi_Nugget, 1);
	};
	
	AI_Output			(self, other, "DIA_Talbin_NW_07_05"); //May Innos protect you.

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP (XP_SavedTalbin);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW_PERM		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_NW_PERM_Condition;
	information	 = 	DIA_Talbin_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Everything all right?";
};

func int DIA_Talbin_NW_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_NW_PERM_15_00"); //Everything all right?
	AI_Output			(self, other, "DIA_Talbin_NW_PERM_07_01"); //Yes, thank you. Just go now. I'll be OK.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////

instance DIA_Talbin_TEACHHUNTING_NW		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr          = 12;
	condition	 = 	DIA_Talbin_TEACHHUNTING_NW_Condition;
	information	 = 	DIA_Talbin_TEACHHUNTING_NW_Info;
	permanent	= TRUE;
	description	 = 	"Can you teach me something about hunting?";
};

func int DIA_Talbin_TEACHHUNTING_NW_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Talbin_NW) || (Talbin_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_NW_Info ()
{
	AI_Output			(other,self,"DIA_Grom_AskTeacher_15_00"); //Can you teach me something about hunting?
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
	{
		AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //What do you want to know?
		if(!Npc_KnowsInfo(other,DIA_Talbin_AskTeacher) && (Talbin_TeachAnimalTrophy == FALSE))
		{
			Talbin_TeachAnimalTrophy = TRUE;
			Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
			B_LogEntry		(TOPIC_OutTeacher, "Talbin can teach me to take animal trophies.");
		};
		Info_AddChoice		(DIA_Talbin_TEACHHUNTING_NW, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_NW_BACK);
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(DIA_Talbin_TEACHHUNTING_NW, B_BuildLearnString ("Remove claws",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Talbin_TEACHHUNTING_Claws_NW);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{ 
			Info_AddChoice	(DIA_Talbin_TEACHHUNTING_NW, B_BuildLearnString ("Skin",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Talbin_TEACHHUNTING_Fur_NW);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		{ 
			Info_AddChoice	(DIA_Talbin_TEACHHUNTING_NW, B_BuildLearnString ("Shadowbeast horn",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Talbin_TEACHHUNTING_ShadowHorn_NW);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
		{ 
			Info_AddChoice	(DIA_Talbin_TEACHHUNTING_NW, B_BuildLearnString ("Remove heart",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Talbin_TEACHHUNTING_Heart_NW);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Talbin_TEACHHUNTING_NW_BACK()
{
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING_NW);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws_NW()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //Chopping off claws is quite simple. You just grab the claw directly at the joint and press it down to the ground.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //Then you take your knife and carefully cut off the claw.
		};

		Info_ClearChoices	(DIA_Talbin_TEACHHUNTING_NW);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur_NW()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //The easiest way to skin a lurker is to make a cut along the length of its belly...
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //... then tug on its hind legs and thus pull off the skin in one piece from back to front.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING_NW);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn_NW ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //Shadowbeast horns are very hard and can be used to create statues or tools.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING_NW);
};
func void DIA_Talbin_TEACHHUNTING_Heart_NW ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //Hearts of magical beings are very rare and hard to obtain. Be careful when you try that, especially with any kind of golem.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING_NW);
};