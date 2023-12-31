
// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance DIA_AkilsSchaf_EXIT(C_Info)
{
	npc = Follow_Sheep_AKIL;
	nr = 999;
	condition = DIA_AkilsSchaf_EXIT_Condition;
	information = DIA_AkilsSchaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AkilsSchaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AkilsSchaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Komm mit
// ************************************************************
INSTANCE DIA_AkilsSchaf_KommMit (C_INFO)
{
	npc			= Follow_Sheep_AKIL;
	nr			= 1;
	condition	= DIA_AkilsSchaf_KommMit_Condition;
	information	= DIA_AkilsSchaf_KommMit_Info;
	permanent = TRUE;
	description = "Come with me!"; 
};                       
FUNC INT DIA_AkilsSchaf_KommMit_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS)
	&& (!Npc_KnowsInfo(other,DIA_Akil_AkilsSchaf))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_AkilsSchaf_KommMit_Info()
{	
	B_KommMit ();
	B_LieselMaeh ();
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (Npc_IsDead(BDT_1025_Bandit_H) == FALSE)
	{
		BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	};
	if (Npc_IsDead(BDT_1026_Bandit_H) == FALSE)
	{
		BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	};

	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Warte hier
// ************************************************************

INSTANCE DIA_AkilsSchaf_WarteHier (C_INFO)
{
	npc			= Follow_Sheep;
	nr			= 1;
	condition	= DIA_AkilsSchaf_WarteHier_Condition;
	information	= DIA_AkilsSchaf_WarteHier_Info;
	permanent	= TRUE;
	description = "Wait here!";
};                       
FUNC INT DIA_AkilsSchaf_WarteHier_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS)
	&& (!Npc_KnowsInfo(other,DIA_Akil_AkilsSchaf))
	{
		return TRUE;
	};
};
FUNC VOID DIA_AkilsSchaf_WarteHier_Info()
{	
	AI_Output (other, self,"DIA_Liesel_WarteHier_15_00");	//Wait here!
	B_LieselMaeh ();
	Npc_ExchangeRoutine(self,"Cave");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
};
