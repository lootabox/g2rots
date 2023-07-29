// ******************
// B_TeachMagicCircle
// ******************

func int B_TeachMagicCircle (var C_NPC slf, var C_NPC oth, var int circle)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_MAGE, circle);
	
	
	// EXIT IF...
	
	// ------ falscher Parameter ------
	if (circle < 1) || (circle > 6)
	{
		Print ("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	
	// FUNC
	
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	// ------ Kreis setzen ------
	Npc_SetTalentSkill (oth, NPC_TALENT_MAGE, circle);
	Log_CreateTopic (TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry (TOPIC_TalentMagicCircle,"The magic runes I have access to are divided into Circles. I can't use a spell that requires a higher Circle than the ones I've mastered."); 
	

	// Make sure armor bonus is calculated correctly
	var C_Item armor; armor = Npc_GetEquippedArmor(other);
	var C_NPC slfTmp; slfTmp = Hlp_GetNpc(self); self = Hlp_GetNpc(other);
	if (Hlp_IsItem(armor, ITAR_KDF_L)) {
		UnEquip_ITAR_KDF_L();
		Equip_ITAR_KDF_L();
	} else if (Hlp_IsItem(armor, ITAR_KDF_H)) {
		UnEquip_ITAR_KDF_H();
		Equip_ITAR_KDF_H();
	};
	self = Hlp_GetNpc (slfTmp);

	// ------ 1. Kreis ------
	if (circle == 1)
	{
		PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 1st Circle are: Light, Fire Arrow, Small Lightning, Heal Light Wounds and Summon Goblin Skeleton.");
		return TRUE;
	};
	
	// ------ 2. Kreis ------
	if (circle == 2)
	{
		PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 2nd Circle are: Fireball, Ice Arrow, Summon Wolf, Wind Fist and Sleep.");
		return TRUE;
	};
	
	// ------ 3. Kreis ------
	if (circle == 3)
	{
		PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 3rd Circle are: Heal Medium Wounds, Ball Lightning, Small Fire Storm, Summon Skeleton, Fear and Ice Block.");
		return TRUE;
	};
	
	// ------ 4. Kreis ------
	if (circle == 4)
	{
		PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 4th Circle are: Lightning, Summon Stone Golem, Destroy Undead and Large Fireball.");
		return TRUE;
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 5th Circle are: Large Fire Storm, Ice Wave, Summon Demon and Heal Heavy Wounds.");
		return TRUE;
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"The spells of the 6th Circle are: Rain of Fire, Breath of Death, Wave of Death, Army of Darkness and Shrink Monster.");
		return TRUE;
	};
};






	
	
	
	
	
	
	

		
	
	
	

	
	
	
	
	

	
	
	

