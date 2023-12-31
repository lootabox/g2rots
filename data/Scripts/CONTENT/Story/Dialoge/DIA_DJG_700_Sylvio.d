
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################



//***************************************************************************
//	Info EXIT
//***************************************************************************
INSTANCE DIA_SylvioDJG_EXIT (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr   		= 999;
	condition	= DIA_SylvioDJG_EXIT_Condition;
	information	= DIA_SylvioDJG_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func VOID DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_HelloAgain		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_HelloAgain_Condition;
	information	 = 	DIA_SylvioDJG_HelloAgain_Info;
	important	 = 	TRUE;

};

func int DIA_SylvioDJG_HelloAgain_Condition ()
{
	if 	((Npc_IsDead(IceDragon))== FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_HelloAgain_Info ()
{
	if((other.guild == GIL_SLD)||(other.guild == GIL_DJG))
	{
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_00"); //Well, I'll be damned. Looking for profit, huh? I knew it! You've got the soul of a mercenary.
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_01"); //Listen, if you think you can make a pile here, you're thoroughly mistaken. I was here first.
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_02"); //Hey, you! Magicians make me nervous! Go somewhere else! There's nothing here.
	}
	else
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_03"); //Hey, you, paladin! Go back to your ore mine. There's nothing here.
	};
	
	AI_Output			(other, self, "DIA_SylvioDJG_HelloAgain_15_04"); //Understood. Nobody likes to part with his booty.
	AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_05"); //You said it. Disappear.
};

///////////////////////////////////////////////////////////////////////
//	Info Versager
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_VERSAGER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	6;
	condition	 = 	DIA_Sylvio_VERSAGER_Condition;
	information	 = 	DIA_Sylvio_VERSAGER_Info;

	description	 = 	"And what if I won't go?";
};

func int DIA_Sylvio_VERSAGER_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_VERSAGER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_VERSAGER_15_00"); //And what if I won't go?
	AI_Output			(self, other, "DIA_Sylvio_VERSAGER_09_01"); //Don't play the big man here, squirt, otherwise you'll wind up just like those poor swine lying dead back there in the snow.
};


///////////////////////////////////////////////////////////////////////
//	Info DeineLeute
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DEINELEUTE		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	7;
	condition	 = 	DIA_Sylvio_DEINELEUTE_Condition;
	information	 = 	DIA_Sylvio_DEINELEUTE_Info;

	description	 = 	"Those were your people?";
};

func int DIA_Sylvio_DEINELEUTE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		&& (MIS_DJG_Sylvio_KillIceGolem == 0)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_DEINELEUTE_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DEINELEUTE_15_00"); //Those were your people?
	AI_Output			(self, other, "DIA_Sylvio_DEINELEUTE_09_01"); //Not any more. No big loss. Those idiots weren't worth much anyway.
};


///////////////////////////////////////////////////////////////////////
//	Info WasIstPassiert
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASISTPASSIERT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	8;
	condition	 = 	DIA_Sylvio_WASISTPASSIERT_Condition;
	information	 = 	DIA_Sylvio_WASISTPASSIERT_Info;

	description	 = 	"What happened to them?";
};

func int DIA_Sylvio_WASISTPASSIERT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_WASISTPASSIERT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_15_00"); //What happened to them?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_01"); //They weren't able to get past the big ice giants back there and got stamped out by them.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_02"); //If you're such a tough guy, why don't you give it a try?


	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "All right, then. Why not?", DIA_Sylvio_WASISTPASSIERT_ok );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "How would it help you if I did it?", DIA_Sylvio_WASISTPASSIERT_washastdudavon );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "What's in it for me?", DIA_Sylvio_WASISTPASSIERT_warum );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Why don't you get rid of them yourself?", DIA_Sylvio_WASISTPASSIERT_selbst );

	Log_CreateTopic (TOPIC_SylvioKillIceGolem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem, LOG_RUNNING);
	B_LogEntry (TOPIC_SylvioKillIceGolem,"Sylvio's scared of the two ice golems at the entrance to the ice region in the Valley of Mines."); 

	MIS_DJG_Sylvio_KillIceGolem = LOG_RUNNING;
};
func void DIA_Sylvio_WASISTPASSIERT_selbst ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_selbst_15_00"); //Why don't you get rid of them yourself?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_01"); //Come, come. Don't puff yourself up like that.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_02"); //If you ask me, you're scared shitless.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "I'm not playing your little games.", DIA_Sylvio_WASISTPASSIERT_keinInteresse );

};
var int DJG_Sylvio_PromisedMoney;
func void DIA_Sylvio_WASISTPASSIERT_warum ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_warum_15_00"); //What's in it for me?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_warum_09_01"); //Dunno. Let's say... 1000 gold pieces. How's that sound?

	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00"); //How would it help you if I did it?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01"); //It's all the same to you. But to answer your question, I want to go into the ice region.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02"); //Unfortunately, those damned things are in my way.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "What do you want to do in the ice region?", DIA_Sylvio_WASISTPASSIERT_Eisregion );

};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00"); //I'm not playing your little games.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01"); //Ahh. Then get out of here, you coward.

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00"); //What do you want to do in the ice region?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01"); //You don't stop with the questions, do you? All right, I'll tell you.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02"); //Here, behind these cliffs, is a wasteland of ice like you've never seen before.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03"); //A jewel of an ice dragon is hiding there with his fat hoard.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04"); //I want it. So, what's it to be? Yes or no?
};
func void DIA_Sylvio_WASISTPASSIERT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_ok_15_00"); //All right, then. Why not?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_ok_09_01"); //Then hurry up. I haven't got all day.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IceGolemsKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_ICEGOLEMSKILLED		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	9;
	condition	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Info;

	description	 = 	"Your path is clear! Your ice giants are no more.";
};

func int DIA_Sylvio_ICEGOLEMSKILLED_Condition ()
{
	if 	(Npc_IsDead(IceGolem_Sylvio1))
		&& (Npc_IsDead(IceGolem_Sylvio2))
		&& (MIS_DJG_Sylvio_KillIceGolem  == LOG_RUNNING)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_00"); //Your path is clear! Your ice giants are no more.
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_01"); //Good work. Let's see what we have.

	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_02"); //Just a moment. What about the money?
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_03"); //All in its own good time.
	};

	AI_StopProcessInfos	(self);

	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP (XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine	(self,		"IceWait1");
	B_StartotherRoutine (DJG_Bullco,"IceWait1");	
};


///////////////////////////////////////////////////////////////////////
//	Info Wasjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASJETZT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	10;
	condition	 = 	DIA_Sylvio_WASJETZT_Condition;
	information	 = 	DIA_Sylvio_WASJETZT_Info;

	description	 = 	"What next?";
};

func int DIA_Sylvio_WASJETZT_Condition ()
{
	if 	(MIS_DJG_Sylvio_KillIceGolem  == LOG_SUCCESS)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_WASJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_15_00"); //What next?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_01"); //Well. I'd say it looks pretty bad.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_02"); //The best thing is you go ahead and I'll just follow you.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "All right, then.", DIA_Sylvio_WASJETZT_ok );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Are you afraid?", DIA_Sylvio_WASJETZT_trennen );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "I won't do the dirty work for you.", DIA_Sylvio_WASJETZT_nein );
	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "First, I want to see my money.", DIA_Sylvio_WASJETZT_Geld );
	};
};
func void DIA_Sylvio_WASJETZT_trennen ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_trennen_15_00"); //Are you afraid?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_trennen_09_01"); //Nonsense, cut out the drivel. Now move.

};

func void DIA_Sylvio_WASJETZT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_ok_15_00"); //All right, then.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_ok_09_01"); //Well, go on. Hop to it.

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_nein ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_nein_15_00"); //I won't do the dirty work for you.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_nein_09_01"); //Coward!

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_Geld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_Geld_15_00"); //First, I want to see my money.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_Geld_09_01"); //Once we've got the dragon, you can have as much gold as you can carry.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "I want my money now.", DIA_Sylvio_WASJETZT_jetztGeld );
};

func void DIA_Sylvio_WASJETZT_jetztGeld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_jetztGeld_15_00"); //I want my money now.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_jetztGeld_09_01"); //Either you go in front or you'll have me to deal with.
};

///////////////////////////////////////////////////////////////////////
//	Info Kommstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_KOMMSTDU		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_KOMMSTDU_Condition;
	information	 = 	DIA_Sylvio_KOMMSTDU_Info;
	permanent	 = 	TRUE;

	description	 = 	"I thought you were headed for the ice region.";
};

func int DIA_Sylvio_KOMMSTDU_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Sylvio_WASJETZT))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_KOMMSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_KOMMSTDU_15_00"); //I thought you were headed for the ice region.
	AI_Output			(self, other, "DIA_Sylvio_KOMMSTDU_09_01"); //Go ahead in front. I'll be right behind you.

	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info DuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DUHIER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_DUHIER_Condition;
	information	 = 	DIA_Sylvio_DUHIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"I could use some help.";
};

func int DIA_Sylvio_DUHIER_Condition ()
{
	if 	((Npc_IsDead(IceDragon)) == FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_DUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DUHIER_15_00"); //I could use some help.
	AI_Output			(self, other, "DIA_Sylvio_DUHIER_09_01"); //Nonsense. You're doing great.
	
	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	12;
	condition	 = 	DIA_SylvioDJG_WHATNEXT_Condition;
	information	 = 	DIA_SylvioDJG_WHATNEXT_Info;
	important	 = 	TRUE;
};

func int DIA_SylvioDJG_WHATNEXT_Condition ()
{
	if 	(Npc_IsDead(IceDragon))		
		{
			return TRUE;
		};
};

func void DIA_SylvioDJG_WHATNEXT_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //The ice dragon is dead! And now give me everything you have on you!
	AI_Output	(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //No way in hell!
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //It's me who's going to be famous for slaying the ice dragon.
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_03"); //Your small role in this matter is over!

	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice	(DIA_SylvioDJG_WHATNEXT, DIALOG_ENDE, DIA_SylvioDJG_WHATNEXT_ATTACK );
};
func void DIA_SylvioDJG_WHATNEXT_ATTACK ()
{
	AI_StopProcessInfos	(self);
	Npc_SetRefuseTalk (self,60);

	Npc_ExchangeRoutine (self,	"Start");
	B_StartOtherRoutine (DJG_Bullco,"Start");

	B_LogEntry (TOPIC_Dragonhunter,"That dirty pig Sylvio was after claiming my victory over the ice dragons. There was a bit of an argument."); 

	B_Attack (self, other, AR_KILL, 1);
	B_Attack (DJG_Bullco, other, AR_NONE, 1);
	if (Biff.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		B_Attack(Biff,DJG_Bullco,AR_GuardStopsFight,1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ButNow
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_BUTNOW		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	13;
	condition	 = 	DIA_SylvioDJG_BUTNOW_Condition;
	information	 = 	DIA_SylvioDJG_BUTNOW_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition ()
{
	if 	(Npc_IsDead(IceDragon))
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (Npc_KnowsInfo(other, DIA_SylvioDJG_WHATNEXT))
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_BUTNOW_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_BUTNOW_09_00"); //It's time to settle the score.
	
	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self,60);

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sylvio_PICKPOCKET (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr			= 900;
	condition	= DIA_Sylvio_PICKPOCKET_Condition;
	information	= DIA_Sylvio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sylvio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 560);
};
 
FUNC VOID DIA_Sylvio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_BACK 		,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};
	
func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};
