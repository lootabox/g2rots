///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engor_EXIT   (C_INFO)
{
	npc         = VLK_4108_Engor;
	nr          = 999;
	condition   = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HALLO		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_HALLO_Condition;
	information	 = 	DIA_Engor_HALLO_Info;
	important	 = 	TRUE;
};
func int DIA_Engor_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Engor_HALLO_Info ()
{
	
 	AI_Output (self, other, "DIA_Engor_HALLO_13_00"); //Ah, so you're the guy who made it across the pass.
	AI_Output (other, self, "DIA_Engor_HALLO_15_01"); //Yes.
	AI_Output (self, other, "DIA_Engor_HALLO_13_02"); //Great. I'm Engor - I manage this expedition.
	AI_Output (self, other, "DIA_Engor_HALLO_13_03"); //Just don't get the idea that I give anything away for free!
	AI_Output (self, other, "DIA_Engor_HALLO_13_04"); //But if there's gold in your pockets, I'm always willing to cut a little deal.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, "Engor manages the supplies at the castle and does a bit of business on the side.");  
};
///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HANDELN		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	10;
	condition	 = 	DIA_Engor_HANDELN_Condition;
	information	 = 	DIA_Engor_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Show me your wares.";
};

func int DIA_Engor_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Engor_HANDELN_Info ()
{
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output			(other, self, "DIA_Engor_HANDELN_15_00"); //Show me your wares.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTPARLAF
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_ABOUTPARLAF		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_ABOUTPARLAF_Condition;
	information	 = 	DIA_Engor_ABOUTPARLAF_Info;
	description	 = 	"You're the one who deals out the rations, or so I've heard.";
};

func int DIA_Engor_ABOUTPARLAF_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Parlaf_ENGOR)
	{
		return TRUE;
	};
};
func void DIA_Engor_ABOUTPARLAF_Info ()
{
	AI_Output (other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //You're the one who deals out the rations, or so I've heard.
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //That's right. Why? Should I feed you now, too?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //If there's anything you want, you'll pay for it - just like everyone else.
};
///////////////////////////////////////////////////////////////////////
//	Info Ruestung
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Ruestung		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_Ruestung_Condition;
	information	 = 	DIA_Engor_Ruestung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Have you got anything interesting for me?";
};

func int DIA_Engor_Ruestung_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Engor_Ruestung_Info ()
{
	AI_Output (other, self, "DIA_Engor_Ruestung_15_00"); //Have you got anything interesting for me?
	AI_Output (self, other, "DIA_Engor_Ruestung_13_01"); //I can get you better armor - heavy militia armor, if you're interested.
	AI_Output (self, other, "DIA_Engor_Ruestung_13_02"); //It's not cheap, of course. So go get the gold, and I'll give you the armor.
};
///////////////////////////////////////////////////////////////////////
//	Info RSkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_RSkaufen		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_RSkaufen_Condition;
	information	 = 	DIA_Engor_RSkaufen_Info;
	permanent 	 =  TRUE;
	description	 = 	"Give me the armor."; 
};
//--------------------------------------
var int DIA_Engor_RSkaufen_perm;
//--------------------------------------
func int DIA_Engor_RSkaufen_Condition ()
{
	var int AFIP_ShowItem; AFIP_ShowItem = ITAR_MIL_M;

	if (other.guild == GIL_MIL)
	&& Npc_KnowsInfo (other, DIA_Engor_Ruestung)
	&& (DIA_Engor_RSkaufen_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Engor_RSkaufen_Info ()
{
	AI_Output (other, self, "DIA_Engor_RSkaufen_15_00"); //Give me the armor.
	if (B_GiveInvItems (other, self, Itmi_Gold,VALUE_ITAR_MIL_M))
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_01"); //Here you are, it'll protect you well - it's a damn good piece of work.
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_MIL_M);
		B_GiveInvItems (self,other, ITAR_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_02"); //Go get the gold first.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HELP		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	3;
	condition	 = 	DIA_Engor_HELP_Condition;
	information	 = 	DIA_Engor_HELP_Info;
	description	 = 	"Maybe I can help you with your work.";
};

func int DIA_Engor_HELP_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_ABOUTPARLAF)
	{
		return TRUE;
	};
};
func void DIA_Engor_HELP_Info ()
{
	AI_Output (other, self, "DIA_Engor_HELP_15_00"); //Maybe I can help you with your work.
	AI_Output (self, other, "DIA_Engor_HELP_13_01"); //Hmm... Sure, why not? I could use some help.
	AI_Output (other, self, "DIA_Engor_HELP_15_02"); //So, what needs to be done?
	AI_Output (self, other, "DIA_Engor_HELP_13_03"); //Our food supplies are low. Above all, we're almost out of meat.
	AI_Output (self, other, "DIA_Engor_HELP_13_04"); //So if you could get us some meat, raw or cooked, ham or sausages, that would be much appreciated. How about it, will you help us?

	
	Info_ClearChoices (DIA_Engor_HELP);
	Info_AddChoice (DIA_Engor_HELP,"I've got no time for that.",DIA_Engor_HELP_NO);
	Info_AddChoice (DIA_Engor_HELP,"Don't worry, I'll get you some meat.",DIA_Engor_HELP_YES);
	
	
};
FUNC VOID DIA_Engor_HELP_NO()
{
	AI_Output (other, self, "DIA_Engor_HELP_NO_15_00"); //I don't have time for that.
	AI_Output (self, other, "DIA_Engor_HELP_NO_13_01"); //So what are you wasting mine for?
	
	MIS_Engor_BringMeat = LOG_OBSOLETE; 
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Engor_HELP_YES()
{
	AI_Output (other, self, "DIA_Engor_HELP_YES_15_00"); //Don't worry, I'll get you some meat.
	AI_Output (self, other, "DIA_Engor_HELP_YES_13_01"); //About two dozen chunks of meat would help me feed quite a few hungry mouths. Come back when you have the meat. I need to get back to my work now.

	Log_CreateTopic (TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry  (TOPIC_BringMeat,"Engor needs two dozen chunks of meat to supply the men with.");
	B_LogEntry  (TOPIC_BringMeat,"It doesn't matter whether it's sausages, ham, fried meat or raw meat. Just as long as the boys get something decent to bite.");  

	
	MIS_Engor_BringMeat = LOG_RUNNING;  
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BRINGMEAT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_BRINGMEAT		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	4;
	condition	 = 	DIA_Engor_BRINGMEAT_Condition;
	information	 = 	DIA_Engor_BRINGMEAT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Here, I bought you something (give meat).";
};

func int DIA_Engor_BRINGMEAT_Condition ()
{	
	if (MIS_Engor_BringMeat == LOG_RUNNING)
	&& (Meat_Counter < Meat_Amount)
	&&((Npc_HasItems (hero, ItFo_Bacon) 	>= 1)
	|| (Npc_HasItems (hero, ItFoMuttonRaw)  >= 1)
	|| (Npc_HasItems (hero, ItFoMutton) 	>= 1)
	|| (Npc_HasItems (hero, ItFo_Sausage) 	>= 1))
	{
		return TRUE;
	};
};
func void DIA_Engor_BRINGMEAT_Info ()
{
	AI_Output (other, self, "DIA_Engor_BRINGMEAT_15_00"); //Here, I bought you something.

	var string ConcatText;
	var int amount;
	var int ypos;

	ypos = 35;

	// ***** Rohes Fleisch *****
	amount = Npc_HasItems (hero, ItFoMuttonRaw);
	if (amount >= 1)
	&& (Meat_Counter < Meat_Amount)
	{
		if (amount > (Meat_Amount - Meat_Counter))
		{
			amount = (Meat_Amount - Meat_Counter);
		};
		Meat_Counter += amount;

		Npc_RemoveInvItems (other, ItFoMuttonRaw, amount);

		ConcatText = IntToString (amount);
		ConcatText = ConcatStrings (ConcatText, " piece(s) of Raw Meat given");
		AI_PrintScreen (ConcatText, -1, ypos, FONT_ScreenSmall, 2);
		ypos += 3;
	};
	
	// ***** gebratenes Fleisch *****
	amount = Npc_HasItems (hero, ItFoMutton);
	if (amount >= 1)
	&& (Meat_Counter < Meat_Amount)
	{
		if (amount > (Meat_Amount - Meat_Counter))
		{
			amount = (Meat_Amount - Meat_Counter);
		};
		Meat_Counter += amount;

		Npc_RemoveInvItems (other, ItFoMutton, amount);

		ConcatText = IntToString (amount);
		ConcatText = ConcatStrings (ConcatText, " piece(s) of Fried Meat given");
		AI_PrintScreen (ConcatText, -1, ypos, FONT_ScreenSmall, 2);
		ypos += 3;
	};
	
	// ***** Schinken *****
	amount = Npc_HasItems (hero, ItFo_Bacon);
	if (amount >= 1)
	&& (Meat_Counter < Meat_Amount)
	{
		if (amount > (Meat_Amount - Meat_Counter))
		{
			amount = (Meat_Amount - Meat_Counter);
		};
		Meat_Counter += amount;

		Npc_RemoveInvItems (other, ItFo_Bacon, amount);

		ConcatText = IntToString (amount);
		ConcatText = ConcatStrings (ConcatText, " Ham(s) given");
		AI_PrintScreen (ConcatText, -1, ypos, FONT_ScreenSmall, 2);
		ypos += 3;
	};

	// ***** Würste *****
	amount = Npc_HasItems (hero, ItFo_Sausage);
	if (amount >= 1)
	&& (Meat_Counter < Meat_Amount)
	{
		if (amount > (Meat_Amount - Meat_Counter))
		{
			amount = (Meat_Amount - Meat_Counter);
		};
		Meat_Counter += amount;

		Npc_RemoveInvItems (other, ItFo_Sausage, amount);

		ConcatText = IntToString (amount);
		ConcatText = ConcatStrings (ConcatText, " Sausage(s) given");
		AI_PrintScreen (ConcatText, -1, ypos, FONT_ScreenSmall, 2);
		ypos += 3;
	};

	// ***** Dialoge und XP *****	
	if (Meat_Counter < Meat_Amount)
	{	
		var string GesamtFleisch;
		
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_01"); //That's not bad for starters, but I need more.
		
		GesamtFleisch = IntToString (Meat_Counter);
		GesamtFleisch = ConcatStrings ("Total pieces of meat given: ",GesamtFleisch);
		
		AI_PrintScreen (GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_02"); //Great, you brought enough meat. That'll do for a while.
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_03"); //But don't get the idea that I'll give you anything for free now!
		/*
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schön. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information. 	
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP (XP_BringMeat);
		Log_AddEntry (TOPIC_BringMeat,"Engor's got the meat. He'll make sure it's shared out among the men."); 
	};
};

//*************************************
//*************************************
//***								***
//***			Kapitel 4			***
//***								***
//*************************************
//*************************************

///////////////////////////////////////////////////////////////////////
//	Wie laufen die Geschäfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	1;
	condition	 = 	DIA_Engor_Business_Condition;
	information	 = 	DIA_Engor_Business_Info;
	permanent	 =	FALSE;	
	description	 = 	"How's business?";
	
};

func int DIA_Engor_Business_Condition ()
{
	if (Kapitel >= 4)
	&& (MIS_Engor_BringMeat == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Engor_Business_Info ()
{
	AI_Output (other, self, "DIA_Engor_Business_15_00"); //How's business?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_01"); //So-so. I hope that the dragon hunters are as full of gold as they are of hot air.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_02"); //Lousy! The paladins just aren't buying a thing.
		};

	AI_Output (self, other, "DIA_Engor_Business_13_03"); //How about you, is there anything else you need?
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engor_PICKPOCKET (C_INFO)
{
	npc			= VLK_4108_Engor;
	nr			= 900;
	condition	= DIA_Engor_PICKPOCKET_Condition;
	information	= DIA_Engor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(It would be risky to steal his map)";
};                       

FUNC INT DIA_Engor_PICKPOCKET_Condition()
{
	return C_StealItem(40, ItWr_Map_Oldworld);
};
 
FUNC VOID DIA_Engor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engor_PICKPOCKET);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_BACK 		,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	B_StealItem(40, ItWr_Map_Oldworld);
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
};
	
func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engor_PICKPOCKET);
};
