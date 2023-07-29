///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"Where does this path lead?";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//Where does this path lead?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Behind the gate lies the pass to the Valley of Mines.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//We're on this side - on the other, a few orcs have dug themselves in.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//It's better if you go back - you cannot get through here.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	var c_npc PAL_297; PAL_297 = Hlp_GetNpc(PAL_297_Ritter);
	var c_npc PAL_298; PAL_298 = Hlp_GetNpc(PAL_298_Ritter);

	if (Npc_IsDead(PAL_297) || Npc_GetDistToNpc(hero, PAL_297) > PERC_DIST_DIALOG * 2)
	{
		AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Are you sure you want to go in there? I'm afraid you won't get very far - the orcs are on the other side.
		AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//If there's a way into the Valley of Mines, I shall find it.
		AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Good, then go. Go with Innos.
	}
	else
	{
		TRIA_Invite(PAL_297);
		TRIA_Start();
		
		TRIA_Next(PAL_298); AI_LookAtNpc(hero, PAL_298);
		AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Are you sure you want to go in there? I'm afraid you won't get very far - the orcs are on the other side.
		AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//If there's a way into the Valley of Mines, I shall find it.
		
		TRIA_Next(PAL_297); AI_LookAtNpc(hero, PAL_297);
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_02"); //It is very courageous of you to enter the valley. Just as long as you have enough healing potions with you.

		if (Npc_HasItems(hero, ItPo_Health_01) + Npc_HasItems(hero, ItPo_Health_02) + Npc_HasItems(hero, ItPo_Health_03) + Npc_HasItems(hero, ItPo_Health_Addon_04) > 1)
		{
			AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Yes, I do.
		}
		else
		{
			AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //Well...
		};

		TRIA_Next(PAL_298); AI_LookAtNpc(hero, PAL_298);
		AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Good, then go. Go with Innos.

		TRIA_Finish();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"And what if I go at my own risk?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//And what if I go at my own risk?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Then you will die. That's why we're here. So that you don't get such stupid ideas.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"How's the situation?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//How's the situation?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Everything's quiet. We have the situation under control.
};


