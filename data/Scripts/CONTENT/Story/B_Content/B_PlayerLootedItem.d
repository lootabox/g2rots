
var int PLI_flag;

func void B_PlayerLootedItem(var c_item itm)
{
	var int inst; inst = Hlp_GetInstanceID(itm);
	if (~PLI_flag & (1 << 0)) && (inst == ItMi_Addon_Bloodwyn_Kopf) {
		PLI_flag = PLI_flag | (1 << 0);
		Snd_Play("CS_IAM_UD_FL_04");
		Mdl_SetVisualBody(Bloodwyn, "Hum_Body_Bloodwyn_Headless", 1, 0, "Hum_Headless", 0, DEFAULT,NO_ARMOR);
		AI_UnequipArmor(Bloodwyn);
		B_StartOtherRoutine(Thorus, "TALK");

	} else if (~PLI_flag & (1 << 1)) && (inst == ItMi_Sextant) && (MIS_RamirezSextant == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 1);
		B_LogEntry(Topic_RamirezSextant, "I found a sextant! I should bring it to Ramirez.");

	} else if (~PLI_flag & (1 << 2)) && (inst == ItWr_ManaRezept) && (MIS_Neorasrezept == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 2);
		B_LogEntry(Topic_Neorasrezept, "I found the recipe! I should bring it to Neoras.");

	} else if (~PLI_flag & (1 << 3)) && (inst == ItMi_HerbPaket) && (MIS_Cipher_Paket <= LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 3);
		if (MIS_Cipher_Paket < LOG_RUNNING) {
			Log_CreateTopic(Topic_CipherPaket, LOG_MISSION);
			Log_SetTopicStatus(Topic_CipherPaket, LOG_RUNNING);
			MIS_Cipher_Paket = LOG_RUNNING;
		};
		B_LogEntry(Topic_CipherPaket, "I found a package of swampweed in a warehouse in the harbor.");

	} else if (~PLI_flag & (1 << 4)) && (inst == ItRi_Prot_Point_01_MIS) && (MIS_CassiaRing == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 4);
		B_LogEntry(Topic_CassiaRing, "I got the ring! I should bring it to Cassia.");

	} else if (inst == ItMi_BloodCup_MIS) && (MIS_CassiaKelche == LOG_RUNNING) {
		if (~PLI_flag & (1 << 5)) && (Npc_GetDistToWP(hero, "NW_CITY_HABOUR_HUT_08_IN_C") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at Lehmar's house.");
			PLI_flag = PLI_flag | (1 << 5);

		} else if (~PLI_flag & (1 << 6)) && (Npc_GetDistToWP(hero, "NW_CITY_UPTOWNPARADE_05") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at Valentino's house.");
			PLI_flag = PLI_flag | (1 << 6);

		} else if (~PLI_flag & (1 << 7)) && (Npc_GetDistToWP(hero, "NW_CITY_GERBRANDT_BED_02") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at Gerbrandt's house.");
			PLI_flag = PLI_flag | (1 << 7);

		} else if (~PLI_flag & (1 << 8)) && (Npc_GetDistToWP(hero, "NW_CITY_RICHTER") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at the judge's house.");
			PLI_flag = PLI_flag | (1 << 8);

		} else if (~PLI_flag & (1 << 9)) && (Npc_GetDistToWP(hero, "NW_CITYHALL_OFFICE_03") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at the town hall.");
			PLI_flag = PLI_flag | (1 << 9);

		} else if (~PLI_flag & (1 << 10)) && (Npc_GetDistToWP(hero, "NW_CITY_UPTOWN_HUT_BED_02") < 500) {
			B_LogEntry(Topic_CassiaKelche, "I found a Blood Chalice at a house next to Salandril's shop.");
			PLI_flag = PLI_flag | (1 << 10);
		};
	} else if (~PLI_flag & (1 << 11)) && (inst == ItWr_BabosDocs_MIS) && (MIS_BabosDocs == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 11);
		B_LogEntry(Topic_BabosDocs, "I got Babo's documents. I could bring them to him now.");

	} else if (~PLI_flag & (1 << 12)) && (inst == ItMi_Addon_Steel_Paket) && (MIS_Huno_Stahl == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 12);
		B_LogEntry(Topic_Addon_Huno, "I have the steel delivery for Huno now. I should bring it him.");

	} else if (~PLI_flag & (1 << 13)) && (inst == ItMi_Addon_Lennar_Paket) && (MIS_Lennar_Lockpick == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 13);
		B_LogEntry(Topic_Addon_Fisk, "I got Fisk's lockpicks. I could bring them to him now.");

	} else if (~PLI_flag & (1 << 14)) && (inst == ItMi_Addon_Stone_04) && (MIS_HlpEdgor == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 14);
		B_LogEntry(Topic_Addon_Stoneplate, "I found the stone tablet Franco wanted.");

	} else if (~PLI_flag & (1 << 15)) && (inst == ItMi_BromorsGeld_Addon) && (MIS_Bromor_LuciaStoleGold == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 15);
		B_LogEntry(TOPIC_Addon_BromorsGold, "I found Bromor's golden bowl. I should deliver it to him when I am back in town.");

	} else if (~PLI_flag & (1 << 16)) && (inst == ItSe_ADDON_CavalornsBeutel) && (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 16);
		Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CavalornTheHut,"I found a bag with one lump of ore near Cavalorn's hut in the Valley of mines. That old rogue Cavalorn must have forgotten it here.");

	} else if (~PLI_flag & (1 << 17)) && (inst == ItMw_BeliarWeapon_Raven) {
		PLI_flag = PLI_flag | (1 << 17);
		B_LogEntry(TOPIC_Addon_Klaue, "I have taken the Claw of Beliar from Raven!");

	} else if (~PLI_flag & (1 << 18)) && (inst == ItMI_Addon_Kompass_Mis) && (MIS_Addon_Garett_BringKompass == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 18);
		B_LogEntry(TOPIC_Addon_Kompass, "I found Garett's Golden Compass! I should bring it back to him.");

	} else if (~PLI_flag & (1 << 19)) && (inst == ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 19);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF, "I found the valuable statuette Daron lost to the goblins.");

	} else if (~PLI_flag & (1 << 20)) && (inst == ItRw_Bow_L_03_MIS) && (MIS_Bosper_Bogen == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 20);
		Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
		B_LogEntry(TOPIC_BosperBogen, "I found Bosper's stolen bow. I should bring it back to him.");

	} else if (~PLI_flag & (1 << 21)) && (inst == ItSe_DiegosTreasure_Mis) && (MIS_HelpDiegoNW == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 21);
		B_LogEntry(TOPIC_HelpDiegoNW, "I found Diego's bag of gold! I should let him know when I get back to Khorinis.");

	} else if (~PLI_flag & (1 << 22)) && (inst == ItAt_ClawLeader) && (Lutero_Krallen == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 22);
		B_LogEntry(TOPIC_Lutero, "I ripped a pair of claws from a snapper pack leader. That ought to have been a beast mighty enough for Lutero's customer.");

	} else if (~PLI_flag & (1 << 23)) && (inst == ItPl_Sagitta_Herb_MIS) && (MIS_Sagitta_Herb <= LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 23);
		Log_CreateTopic (TOPIC_SagittaHerb,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SagittaHerb,LOG_RUNNING);
		B_LogEntry(TOPIC_SagittaHerb, "I found a strange herb growing of a pile of black troll feces.");

	} else if (~PLI_flag & (1 << 24)) && (inst == itmi_runeblank) && (MIS_SCHNITZELJAGD == LOG_RUNNING) && (CurrentLevel == NEWWORLD_ZEN) {
		PLI_flag = PLI_flag | (1 << 24);
		B_LogEntry(TOPIC_Schnitzeljagd, "I found a blank runestone in a chest that the key fit into. This must be what I was supposed to bring back to the High Council.");

	} else if (~PLI_flag & (1 << 25)) && (inst == ItMw_Addon_BanditTrader) && (MIs_Martin_FindTheBanditTrader == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 25);
		B_LogEntry(TOPIC_Addon_Bandittrader, "I found a rapier with the letter 'F' scratched onto the pommel on one of the bandits. I should bring one to Martin.");

	} else if (~PLI_flag & (1 << 26)) && (inst == ItRi_Addon_BanditTrader) && (MIs_Martin_FindTheBanditTrader == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 26);
		B_LogEntry(TOPIC_Addon_Bandittrader, "I took a ring from one of the bandits with an engraving pointing to an overseas trading guild. This could be valuable evidence for Martin.");

	} else if (MIS_SCKnowsInnosEyeIsBroken == FALSE) && (inst == ItMi_InnosEye_Broken_MIS) {
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry (TOPIC_INNOSEYE, "Those sinister guys are getting on my nerves. They destroyed the Eye of Innos. I've no idea how I'm supposed to fix it.");
 		B_LogEntry (TOPIC_TraitorPedro, "I found the Eye of Innos. But there hasn't been a trace of Pedro anywhere so far. Those black magicians are in cahoots with him.");
		B_GivePlayerXP (XP_SCKnowsInnosEyeIsBroken);

	} else if (~PLI_flag & (1 << 27)) && (MIS_Harad_Orc == LOG_RUNNING)
		&& (inst == ItMw_2H_OrcAxe_01	|| inst == ItMw_2H_OrcAxe_02	|| inst == ItMw_2H_OrcAxe_03	|| inst == ItMw_2H_OrcAxe_04
		||	inst == ItMw_2H_OrcSword_01	|| inst == ItMw_2H_OrcSword_02	|| inst == ItMw_2H_OrcMace_01) {
		PLI_flag = PLI_flag | (1 << 27);
		B_LogEntry(TOPIC_HaradOrk, "I managed to get an orc weapon! I could take it to Harad for his approval.");

	};
	// MIS_Maria_BringPlate
	// MIS_Coragon_Silber
};
