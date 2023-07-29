// ************************************************************************
// B_GetLearnCostTalent
// --------------------
// Ermittelt die Kosten eines beliebigen Talentes
// oder die Kosten eines Kampftalent %-Punktes
// in Abhängigkeit des zugeordneten "verwandten" Kampftalentes
// Einhänder - Zweihänder
// Bogen - Armbrust
// Die Kosten für ein Talent% verdoppeln sich, 
// wenn der Spieler das "verwandte" Talent eine STUFE schlechter beherrscht
// Das "untere" Talent wird simultan mit-hochgezogen
// ************************************************************************

func int B_GetLearnCostTalent (var C_NPC oth, var int talent, var int skill)
{
	// ------ Kostenberechnung ------
	var int kosten; kosten = 0;
	
	// ------ Kosten für Magiekreis ------
	if (talent == NPC_TALENT_MAGE)
	{
		if (skill >= 1) && (skill <= 6)
		{
			kosten = (5);
		};
	};
	
	// ------ Combat talents ------
	if (talent == NPC_TALENT_1H)
	|| (talent == NPC_TALENT_2H)
	|| (talent == NPC_TALENT_BOW)
	|| (talent == NPC_TALENT_CROSSBOW)
	{
		// Get current and related talent value, without bonuses
		var int currentReal; var int relatedReal; var int relatedTalent;
			 if (talent == NPC_TALENT_1H)		{ currentReal = oth.aivar[REAL_TALENT_1H];			relatedReal = oth.aivar[REAL_TALENT_2H];		relatedTalent = NPC_TALENT_2H; }
		else if (talent == NPC_TALENT_2H)		{ currentReal = oth.aivar[REAL_TALENT_2H];			relatedReal = oth.aivar[REAL_TALENT_1H];		relatedTalent = NPC_TALENT_1H; }
		else if (talent == NPC_TALENT_BOW)		{ currentReal = oth.aivar[REAL_TALENT_BOW];			relatedReal = oth.aivar[REAL_TALENT_CROSSBOW];	relatedTalent = NPC_TALENT_CROSSBOW; }
		else if (talent == NPC_TALENT_CROSSBOW)	{ currentReal = oth.aivar[REAL_TALENT_CROSSBOW];	relatedReal = oth.aivar[REAL_TALENT_BOW];		relatedTalent = NPC_TALENT_BOW; };

		// Combat talents have same interval for LP cost increases
		const int interval = 30;

		// Base cost (x amount (skill variable = amount)) based on current attribute value
		kosten = skill + skill * (currentReal/interval);

		// Extra value may be added near interval threshold to prevent exploiting
		var int extra; extra = (currentReal - interval * (currentReal/interval)) + (skill - interval);
		if (extra > 0) { kosten += extra; };

		// If related talent is less than half of new current talent value, it is raised accordingly
		skill = (currentReal + skill) / 2 - (relatedReal);
		if (skill > 0) {
			// Same calculation for related base cost and related extra
			kosten += (skill + skill * (relatedReal/interval));
			extra = (relatedReal - interval * (relatedReal/interval)) + (skill - interval);
			if (extra > 0) { kosten += extra; };
		};
	};

	// ------ Kosten für Diebestalente ------
	if (talent == NPC_TALENT_SNEAK)
	|| (talent == NPC_TALENT_ACROBAT)
	{
		kosten = (5);
	};
	
	if (talent == NPC_TALENT_PICKLOCK)
	|| (talent == NPC_TALENT_PICKPOCKET)
	{
		kosten = (10);
	};
		
	// ------ Kosten für Schmieden ------
	if (talent == NPC_TALENT_SMITH)
	{
		if 		(skill == WEAPON_Common) 			{	kosten = (2);	}
		else if (skill == WEAPON_1H_Special_01) 	{	kosten = (4);	}
		else if (skill == WEAPON_2H_Special_01) 	{	kosten = (4);	}
		else if (skill == WEAPON_1H_Special_02) 	{	kosten = (6);	}
		else if (skill == WEAPON_2H_Special_02) 	{	kosten = (6);	}
		else if (skill == WEAPON_1H_Special_03) 	{	kosten = (8);	}
		else if (skill == WEAPON_2H_Special_03) 	{	kosten = (8);	}
		else if (skill == WEAPON_1H_Special_04) 	{	kosten = (10);	}
		else if (skill == WEAPON_2H_Special_04) 	{	kosten = (10);	}

		else if (skill == WEAPON_1H_Harad_01)		{	kosten = (4);	}
		else if (skill == WEAPON_1H_Harad_02)		{	kosten = (6);	}
		else if (skill == WEAPON_1H_Harad_03)		{	kosten = (8);	}
		else if (skill == WEAPON_1H_Harad_04)		{	kosten = (10);	};
	};

	// ------ Kosten für Alchemie ------
	if (talent == NPC_TALENT_ALCHEMY)
	{
		if 		(skill == POTION_Health_01	) 	{	kosten = (1);	}
		else if (skill == POTION_Health_02  ) 	{	kosten = (3);	}
		else if (skill == POTION_Health_03  ) 	{	kosten = (5);	}
		else if (skill == POTION_Health_04	) 	{	kosten = (8);	}
		else if (skill == POTION_Mana_01  	) 	{	kosten = (1);	}
		else if (skill == POTION_Mana_02  	) 	{	kosten = (3);	}
		else if (skill == POTION_Mana_03 	) 	{	kosten = (5);	}
		else if (skill == POTION_Mana_04	) 	{	kosten = (8);	}
		else if (skill == POTION_Speed  	) 	{	kosten = (5);	}
		else if (skill == POTION_Perm_STR  	) 	{	kosten = (20);	}
		else if (skill == POTION_Perm_DEX  	) 	{	kosten = (20);	}
		else if (skill == POTION_Perm_Mana  ) 	{	kosten = (10);	}
		else if (skill == POTION_Perm_Health) 	{	kosten = (10);	}
		else if (skill == POTION_MegaDrink	) 	{	kosten = (20);	};
	};                                                              
	
	// ------ Kosten für Animaltrophy ------
	if (talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if 		(skill == TROPHY_Teeth			) 	{	kosten = (3);	}
		else if (skill == TROPHY_Claws			) 	{	kosten = (3);	}
		else if (skill == TROPHY_Fur			) 	{	kosten = (5);	}
		else if (skill == TROPHY_Heart			) 	{	kosten = (3);	}
		else if (skill == TROPHY_ShadowHorn 	) 	{	kosten = (3);	}
		else if (skill == TROPHY_FireTongue		) 	{	kosten = (1);	}
		else if (skill == TROPHY_BFWing			) 	{	kosten = (1);	}
		else if (skill == TROPHY_BFSting		) 	{	kosten = (1);	}
		else if (skill == TROPHY_Mandibles		) 	{	kosten = (1);	}
		else if (skill == TROPHY_CrawlerPlate	) 	{	kosten = (3);	}
		else if (skill == TROPHY_DrgSnapperHorn	) 	{	kosten = (1);	}
		else if (skill == TROPHY_DragonScale	) 	{	kosten = (3);	}
		else if (skill == TROPHY_DragonBlood	) 	{	kosten = (3);	}
		else if (skill == TROPHY_ReptileSkin	) 	{	kosten = (3);	};
	};                                                                  

	// ------ Kosten für Sprache der Erbauer ------
	if (talent == NPC_TALENT_FOREIGNLANGUAGE) 	//ADDON
	{
		if 		(skill == LANGUAGE_1			) 	{	kosten = (10);	}
		else if (skill == LANGUAGE_2			) 	{	kosten = (10);	}
		else if (skill == LANGUAGE_3			) 	{	kosten = (10);	};
	};

	if (talent == NPC_TALENT_WISPDETECTOR) 	//ADDON
	{
		if 		(skill == WISPSKILL_NF	 	) 	{	kosten = (0);	}
		else if (skill == WISPSKILL_FF	 	) 	{	kosten = (1);	}
		else if (skill == WISPSKILL_NONE 	) 	{	kosten = (2);	}
		else if (skill == WISPSKILL_RUNE 	) 	{	kosten = (3);	}
		else if (skill == WISPSKILL_MAGIC   ) 	{	kosten = (4);	}
		else if (skill == WISPSKILL_FOOD 	) 	{	kosten = (5);	}
		else if (skill == WISPSKILL_POTIONS ) 	{	kosten = (5);	};
	};                                                              
	                                                                
	// ------ Kosten für Runen ------
	if (talent == NPC_TALENT_RUNES)
	{
		// PAL
		if 		(skill == SPL_PalLight			) 	{	kosten = (0);	} // 1 (difficult to show cost in dialog)
		else if (skill == SPL_PalLightHeal		) 	{	kosten = (4);	} // 3
		else if (skill == SPL_PalHolyBolt	    ) 	{	kosten = (4);	} // 3
		else if (skill == SPL_PalMediumHeal		) 	{	kosten = (6);	} // 5
		else if (skill == SPL_PalRepelEvil		) 	{	kosten = (6);	} // 5
		else if (skill == SPL_PalFullHeal	    ) 	{	kosten = (10);	}
		else if (skill == SPL_PalDestroyEvil  	) 	{	kosten = (10);	}
		else if (skill == SPL_PalTeleportSecret ) 	{	kosten = (5);	}
		// 1                                                            
		else if (skill == SPL_Firebolt			) 	{	kosten = (5);	}
		else if (skill == SPL_Icebolt			) 	{	kosten = (5);	}
		else if (skill == SPL_Light 			) 	{	kosten = (1);	}
		else if (skill == SPL_LightHeal			) 	{	kosten = (3);	}
		else if (skill == SPL_SummonWolf		) 	{	kosten = (5);	}
		else if (skill == SPL_Zap				) 	{	kosten = (3);	}
		// 2                                                            
		else if (skill == SPL_IceLance			) 	{	kosten = (5);	}
		else if (skill == SPL_InstantFireball	) 	{	kosten = (10);	}
		else if (skill == SPL_SummonGoblinSkeleton)	{	kosten = (3);	}
		else if (skill == SPL_Whirlwind			) 	{	kosten = (5);	}
		else if (skill == SPL_WindFist			) 	{	kosten = (5);	}
		// 3                                                            
		else if (skill == SPL_ChargeZap			) 	{	kosten = (10);	}
		else if (skill == SPL_DestroyUndead		) 	{	kosten = (10);	}
		else if (skill == SPL_Firestorm			) 	{	kosten = (15);	}
		else if (skill == SPL_IceCube		    ) 	{	kosten = (10);	}
		else if (skill == SPL_MediumHeal	    ) 	{	kosten = (5);	}
		else if (skill == SPL_SummonSkeleton  	) 	{	kosten = (10);	}
        else if (skill == SPL_Geyser			) 	{	kosten = (10);	}
		// 4                                                            
		else if (skill == SPL_ChargeFireball  	) 	{	kosten = (10);	}
		else if (skill == SPL_LightningFlash  	) 	{	kosten = (5);	}
		else if (skill == SPL_SummonGolem	    ) 	{	kosten = (15);	}
		else if (skill == SPL_Thunderstorm		)	{	kosten = (5);	}
		else if (skill == SPL_WaterFist			) 	{	kosten = (10);	}
		// 5                                                            
		else if (skill == SPL_BreathOfDeath		) 	{	kosten = (20);	}
		else if (skill == SPL_FullHeal			) 	{	kosten = (10);	}
		else if (skill == SPL_IceWave		    ) 	{	kosten = (20);	}
		else if (skill == SPL_Pyrokinesis	    ) 	{	kosten = (10);	}
		else if (skill == SPL_SummonDemon	    ) 	{	kosten = (20);	}
		// 6                                                            
		else if (skill == SPL_ArmyOfDarkness  	) 	{	kosten = (20);	}
		else if (skill == SPL_Firerain			) 	{	kosten = (20);	}
		else if (skill == SPL_MassDeath			) 	{	kosten = (20);	}
		else if (skill == SPL_Shrink		    ) 	{	kosten = (20);	}
		// X
		else if (skill == SPL_Charm				) 	{	kosten = (5);	}
		else if (skill == SPL_Fear				) 	{	kosten = (5);	}
		else if (skill == SPL_Sleep				) 	{	kosten = (5);	}
		else if (skill == SPL_MasterOfDisaster	)	{	kosten = (15);	}

		else 										{	kosten = (5);	};
	};

	return kosten;
};
