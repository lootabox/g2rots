
var int PLN_flag;

func void B_PlayerLootedNpc(var c_npc npc)
{
	var int inst; inst = Hlp_GetInstanceID(npc);

	if (~PLI_flag & (1 << 0)) && (inst == BDT_10301_Addon_RangerBandit_M) {
		PLI_flag = PLI_flag | (1 << 0);
		if (PLI_flag & (1 << 1)) {
			B_LogEntry(TOPIC_Addon_Erol, "I managed to find the bandits that had Erol's stone tablets.");
			Erol_CanReturnTablets = TRUE;
		};

	} else if (~PLI_flag & (1 << 1)) && (inst == BDT_10302_Addon_RangerBandit_L) {
		PLI_flag = PLI_flag | (1 << 1);
		if (PLI_flag & (1 << 0)) {
			B_LogEntry(TOPIC_Addon_Erol, "I managed to find the bandits that had Erol's stone tablets.");
			Erol_CanReturnTablets = TRUE;
		};

	} else if (~PLI_flag & (1 << 2)) && (inst == PIR_1368_Addon_Malcom) && (MIS_Owen_FindMalcom == LOG_RUNNING) {
		PLI_flag = PLI_flag | (1 << 2);
		B_LogEntry(TOPIC_Addon_MalcomsStunt, "I found Malcom. Looks like the lurker won their fight.");
		Malcom_Found = TRUE;

	} else if (~PLI_flag & (1 << 3)) && (inst == VLK_4112_Den) {
		PLI_flag = PLI_flag | (1 << 3);
		B_LogEntry(TopicBrutusKasse, "I found Den along with the gold and jewelry he took.");
		MIS_BrutusKasse = TRUE;
		B_GivePlayerXP  (XP_Ambient);

	} else if (~PLI_flag & (1 << 4)) && (inst == NONE_Addon_114_Lance_ADW) {
		PLI_flag = PLI_flag | (1 << 4);
		B_LogEntry(TOPIC_Addon_Lance, "I found Lance's body in the swamp.");

	};
};
