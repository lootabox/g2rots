

instance BAU_964_Bauer (Npc_Default)
{
	// ------ NSC ------
	name 		= "Farmer";
	guild 		= GIL_OUT;
	id 			= 964;
	voice 		= 13;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart11, BodyTex_N, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen f�r Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_964;
};

FUNC VOID Rtn_Start_964 ()
{	
	TA_Saw				(08,00,21,00,"NW_FARM3_STABLE_OUT_01");
    TA_Sit_Campfire		(21,00,08,00,"NW_FARM3_STABLE_REST_02");  
};

FUNC VOID Rtn_FleeFromPass_964 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_BIGMILL_MALAKSVERSTECK_05");	 
    TA_Sit_Campfire 	(22,00,08,00,"NW_BIGMILL_MALAKSVERSTECK_05");
};


