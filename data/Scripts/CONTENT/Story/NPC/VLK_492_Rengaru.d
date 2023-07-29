
instance VLK_492_Rengaru (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rengaru"; 
	guild 		= GIL_VLK;
	id 			= 492;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_IGNORE_Theft] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Sld_Sword);//ItMw_1h_Vlk_Sword
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMi_Gold, 50); //hat er Nagur geklaut! Muss genau 50 im Inv haben M.F. 
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ToughBart01, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_492;
};

FUNC VOID Rtn_Start_492()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"NW_CITY_MERCHANT_PATH_36");
    TA_Stand_Drinking 		(20,15,05,15,"NW_CITY_MERCHANT_PATH_33_B"); 
};

const string Rengaru_RunAwayWP = "NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_01";
FUNC VOID Rtn_RunAway_492()
{	
	//TA_FleeToWP 	(08,00,23,00,"NW_CITY_HABOUR_KASERN_05_01");
    //TA_FleeToWP	(23,00,08,00,"NW_CITY_HABOUR_KASERN_05_01"); 
	TA_FleeToWP 	(08,00,23,00,Rengaru_RunAwayWP);
    TA_FleeToWP		(23,00,08,00,Rengaru_RunAwayWP); 
};

FUNC VOID Rtn_Prison_492()
{	
	TA_Stand_ArmsCrossed 	(08,00,23,00,"NW_CITY_HABOUR_KASERN_RENGARU");
    TA_Stand_ArmsCrossed	(23,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU"); 
};

FUNC VOID Rtn_Hide_492()
{
	TA_Stand_WP		(8,0,23,0,"NW_CITY_HABOUR_SHIP_01");
	TA_Stand_WP		(23,0,8,0,"NW_CITY_HABOUR_SHIP_01");
};



