// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OUT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OUT_1_EXIT_Condition;
	information	= DIA_OUT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OUT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_OUT_1_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_OUT_1_STANDARD_Condition;
	information	= DIA_OUT_1_STANDARD_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func INT DIA_OUT_1_STANDARD_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_OUT_1_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_00"); //Since the Barrier around the penal colony disappeared, we've had constant trouble with bandits.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_01"); //The militia can't be relied on. We have to defend ourselves.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_02"); //I won't let myself be used by anybody. Neither the king, nor fat Onar. I fight only for myself.
	};
	
	AI_StopProcessInfos	(self);
};
	

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OUT_1 (var c_NPC slf)
{
	DIA_OUT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OUT_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
