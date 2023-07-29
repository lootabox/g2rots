// ************************
// B_TeachPlayerTalentRunes
// ************************

func int B_TeachPlayerTalentRunes (var C_NPC slf, var C_NPC oth, var int spell)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_RUNES, spell);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	if (oth.guild == GIL_KDF) {
		Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
		B_LogEntry (TOPIC_TalentRunes,"To create a rune I need the scroll for the spell and certain ingredients for each rune. Using those ingredients and a blank runestone I can create the desired rune at a rune table.");

		// Scrolls und Runen-Joker fehlen
		PrintScreen			(PRINT_LearnRunes, -1, -1, FONT_Screen, 2);
		
		// ------ bei jeder Rune: Runen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
		Npc_SetTalentSkill 	(oth, NPC_TALENT_RUNES, 1);
	};

	var C_NPC ScrollTrader;
	
	if	(Npc_IsDead(Gorax)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if (Npc_IsDead(Isgaroth)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if	(Npc_IsDead(Engor)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if	(Npc_IsDead(Orlan)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	}
	else if (Npc_IsDead (Cronos_ADW) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Cronos_ADW);
	};
	
	// ------ Rune lernen ------
	if (spell == SPL_PalLight)				{	PLAYER_TALENT_RUNES[SPL_PalLight] 				= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalLight,1); };
	if (spell == SPL_PalLightHeal)			{	PLAYER_TALENT_RUNES[SPL_PalLightHeal] 			= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalLightHeal,1); };
	if (spell == SPL_PalHolyBolt)			{	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] 			= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalHolyBolt,1); };
	if (spell == SPL_PalMediumHeal)			{	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] 			= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalMediumHeal,1); };
	if (spell == SPL_PalRepelEvil)			{	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] 			= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalRepelEvil,1); };
	if (spell == SPL_PalFullHeal)			{	PLAYER_TALENT_RUNES[SPL_PalFullHeal] 			= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalFullHeal,1); };
	if (spell == SPL_PalDestroyEvil)		{	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] 		= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalDestroyEvil,1); };
	if (spell == SPL_PalTeleportSecret)		{	PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE;	B_GiveInvItems(slf,oth,ItRu_PalTeleportSecret,1); };

	if (spell == SPL_TeleportSeaport)		{	PLAYER_TALENT_RUNES[SPL_TeleportSeaport] 		= TRUE;	};		
	if (spell == SPL_TeleportMonastery)		{	PLAYER_TALENT_RUNES[SPL_TeleportMonastery] 		= TRUE;	};		
	if (spell == SPL_TeleportFarm)			{	PLAYER_TALENT_RUNES[SPL_TeleportFarm] 			= TRUE;	};		
	if (spell == SPL_TeleportXardas)		{	PLAYER_TALENT_RUNES[SPL_TeleportXardas] 		= TRUE;	};		
	if (spell == SPL_TeleportPassNW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassNW] 		= TRUE;	};		
	if (spell == SPL_TeleportPassOW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassOW] 		= TRUE;	};		
	if (spell == SPL_TeleportOC)			{	PLAYER_TALENT_RUNES[SPL_TeleportOC] 			= TRUE;	};		

	// Teleport-Joker fehlen
	if (spell == SPL_LIGHT)					{	PLAYER_TALENT_RUNES[SPL_LIGHT] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_LIGHT, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Light': 1 gold piece.");	};		
	if (spell == SPL_Firebolt)				{	PLAYER_TALENT_RUNES[SPL_Firebolt] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firebolt, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Fire Arrow': 1 Sulfur.");	};		
	if (spell == SPL_Icebolt)				{	PLAYER_TALENT_RUNES[SPL_Icebolt] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Icebolt, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Ice Arrow': 1 Glacier Quartz.");};		
	if (spell == SPL_LightHeal)				{	PLAYER_TALENT_RUNES[SPL_LightHeal] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_LightHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Heal Light Wounds': 1 Healing Plant.");	};		
	if (spell == SPL_SummonGoblinSkeleton)	{	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] 	= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumGobSkel, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Summon Goblin Skeleton': 1 Goblin's Bone.");	};		
	if (spell == SPL_InstantFireball)		{	PLAYER_TALENT_RUNES[SPL_InstantFireball] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_InstantFireball, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Fireball': 1 Pitch.");	};	
	if (spell == SPL_Zap)					{	PLAYER_TALENT_RUNES[SPL_Zap] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Zap, 1);						
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Small Lightning': 1 Rock Crystal.");	};		
	if (spell == SPL_SummonWolf)			{	PLAYER_TALENT_RUNES[SPL_SummonWolf]				= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumWolf, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Summon Wolf': 1 Wolf Skin.");	};		
	if (spell == SPL_WINDFIST)				{	PLAYER_TALENT_RUNES[SPL_WINDFIST] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_WINDFIST, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Wind Fist': 1 Coal.");	};		
	if (spell == SPL_Sleep)					{	PLAYER_TALENT_RUNES[SPL_Sleep] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Sleep, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Sleep': 1 Swamp Herb.");	};		
	if (spell == SPL_MediumHeal)			{	PLAYER_TALENT_RUNES[SPL_MediumHeal] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_MediumHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Heal Medium Wounds': 1 Healing Herb.");	};		
	if (spell == SPL_LightningFlash)		{	PLAYER_TALENT_RUNES[SPL_LightningFlash] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_LightningFlash, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Lightning': 1 Rock Crystal and 1 Glacier Quartz.");	};	
	if (spell == SPL_ChargeFireball)		{	PLAYER_TALENT_RUNES[SPL_ChargeFireball] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_ChargeFireball, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Large Fireball': 1 Sulfur and 1 Pitch.");	};		
	if (spell == SPL_SummonSkeleton)		{	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumSkel, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Summon Skeleton': 1 Skeleton's Bone.");	};		
	if (spell == SPL_Fear)					{	PLAYER_TALENT_RUNES[SPL_Fear] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Fear, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Fear': 1 Black Perl.");	};		
	if (spell == SPL_IceCube)				{	PLAYER_TALENT_RUNES[SPL_IceCube] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_IceCube, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Ice Block': 1 Glacier Quartz and 1 Aquamarine.");	};		
	if (spell == SPL_ChargeZap)				{	PLAYER_TALENT_RUNES[SPL_ChargeZap] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_ThunderBall, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Ball Lightning': 1 Sulfur and 1 Rock Crystal.");	};		
	if (spell == SPL_SummonGolem)			{	PLAYER_TALENT_RUNES[SPL_SummonGolem] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumGol, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Summon Golem': 1 Heart of a Stonegolem.");	};	
	if (spell == SPL_DestroyUndead)			{	PLAYER_TALENT_RUNES[SPL_DestroyUndead] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_HarmUndead, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Destroy Undead': 1 Holy Water.");	};		
	if (spell == SPL_Pyrokinesis)			{	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_Pyrokinesis, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Large Fire Storm': 1 Sulfur and 1 Tongue of a Fire Lizard.");	};		
	if (spell == SPL_Firestorm)				{	PLAYER_TALENT_RUNES[SPL_Firestorm] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firestorm, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Small Fire Storm': 1 Sulfur and 1 Pitch.");	};		
	if (spell == SPL_IceWave)				{	PLAYER_TALENT_RUNES[SPL_IceWave] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_IceWave, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Wave of Ice': 1 Glacier Quartz and 1 Aquamarine.");	};		
	if (spell == SPL_SummonDemon)			{	PLAYER_TALENT_RUNES[SPL_SummonDemon] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumDemon, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Summon Demon': 1 Heart of a Demon.");	};		
	if (spell == SPL_FullHeal)				{	PLAYER_TALENT_RUNES[SPL_FullHeal] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_FullHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Heal Heavy Wounds': 1 Healing Root.");	};	
	if (spell == SPL_Firerain)				{	PLAYER_TALENT_RUNES[SPL_Firerain] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firerain, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Rain of Fire': 1 Pitch and 1 Tongue of a Fire Lizard.");	};		
	if (spell == SPL_BreathOfDeath)			{	PLAYER_TALENT_RUNES[SPL_BreathOfDeath]			= TRUE;	CreateInvItems (ScrollTrader, ItSc_BreathOfDeath, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Breath of Death': 1 Coal and 1 Black Perl.");	};		
	if (spell == SPL_MassDeath)				{	PLAYER_TALENT_RUNES[SPL_MassDeath] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_MassDeath, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Wave of Death': 1 Skeleton's Bone and 1 Black Perl.");	};		
	if (spell == SPL_ArmyOfDarkness)		{	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_ArmyOfDarkness, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Army of Darkness': 1 Skeleton's Bone, 1 Black Perl, 1 Heart of a Stonegolem and 1 Heart of a Demon. ");	};		
	if (spell == SPL_Shrink)				{	PLAYER_TALENT_RUNES[SPL_Shrink] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Shrink, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Ingredients for the rune 'Shrink Monster': 1 Goblin's Bone and 1 Troll Tusk.");	};		
	
	//Addon
	
	if (spell == SPL_Whirlwind)				{	PLAYER_TALENT_RUNES[SPL_Whirlwind]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Whirlwind, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);	};
	if (spell == SPL_WaterFist)				{	PLAYER_TALENT_RUNES[SPL_WaterFist]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Waterfist, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);	};
	if (spell == SPL_IceLance)				{	PLAYER_TALENT_RUNES[SPL_IceLance]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Icelance, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);	};
	if (spell == SPL_Geyser)				{	PLAYER_TALENT_RUNES[SPL_Geyser]					= TRUE; CreateInvItems (ScrollTrader, ItSc_Geyser, 1);					
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);	};
	if (spell == SPL_Thunderstorm)			{	PLAYER_TALENT_RUNES[SPL_Thunderstorm]			= TRUE; CreateInvItems (ScrollTrader, ItSc_Thunderstorm, 1);			
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);	};
	
	return TRUE;
};

func int TeachPlayerTalentRunes_SPL_ArmyOfDarkness()			{ return B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness); };
func int TeachPlayerTalentRunes_SPL_BreathOfDeath()				{ return B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath); };
func int TeachPlayerTalentRunes_SPL_ChargeFireball()			{ return B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball); };
func int TeachPlayerTalentRunes_SPL_ChargeZap()					{ return B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap); };
func int TeachPlayerTalentRunes_SPL_Charm()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Charm); };
func int TeachPlayerTalentRunes_SPL_ConcussionBolt()			{ return B_TeachPlayerTalentRunes (self, other, SPL_ConcussionBolt); };
func int TeachPlayerTalentRunes_SPL_Deathball()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Deathball); };
func int TeachPlayerTalentRunes_SPL_Deathbolt()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Deathbolt); };
func int TeachPlayerTalentRunes_SPL_DestroyUndead()				{ return B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead); };
func int TeachPlayerTalentRunes_SPL_Earthquake()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Earthquake); };
func int TeachPlayerTalentRunes_SPL_Energyball()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Energyball); };
func int TeachPlayerTalentRunes_SPL_Fear()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Fear); };
func int TeachPlayerTalentRunes_SPL_Firebolt()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Firebolt); };
func int TeachPlayerTalentRunes_SPL_Firerain()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Firerain); };
func int TeachPlayerTalentRunes_SPL_Firestorm()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Firestorm); };
func int TeachPlayerTalentRunes_SPL_FullHeal()					{ return B_TeachPlayerTalentRunes (self, other, SPL_FullHeal); };
func int TeachPlayerTalentRunes_SPL_Geyser()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Geyser); };
func int TeachPlayerTalentRunes_SPL_GreenTentacle()				{ return B_TeachPlayerTalentRunes (self, other, SPL_GreenTentacle); };
func int TeachPlayerTalentRunes_SPL_IceCube()					{ return B_TeachPlayerTalentRunes (self, other, SPL_IceCube); };
func int TeachPlayerTalentRunes_SPL_IceLance()					{ return B_TeachPlayerTalentRunes (self, other, SPL_IceLance); };
func int TeachPlayerTalentRunes_SPL_IceWave()					{ return B_TeachPlayerTalentRunes (self, other, SPL_IceWave); };
func int TeachPlayerTalentRunes_SPL_Icebolt()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Icebolt); };
func int TeachPlayerTalentRunes_SPL_Inflate()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Inflate); };
func int TeachPlayerTalentRunes_SPL_InstantFireball()			{ return B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball); };
func int TeachPlayerTalentRunes_SPL_Light()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Light); };
func int TeachPlayerTalentRunes_SPL_LightHeal()					{ return B_TeachPlayerTalentRunes (self, other, SPL_LightHeal); };
func int TeachPlayerTalentRunes_SPL_LightningFlash()			{ return B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash); };
func int TeachPlayerTalentRunes_SPL_MassDeath()					{ return B_TeachPlayerTalentRunes (self, other, SPL_MassDeath); };
func int TeachPlayerTalentRunes_SPL_MasterOfDisaster()			{ return B_TeachPlayerTalentRunes (self, other, SPL_MasterOfDisaster); };
func int TeachPlayerTalentRunes_SPL_MediumHeal()				{ return B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal); };
func int TeachPlayerTalentRunes_SPL_PalDestroyEvil()			{ return B_TeachPlayerTalentRunes (self, other, SPL_PalDestroyEvil); };
func int TeachPlayerTalentRunes_SPL_PalFullHeal()				{ return B_TeachPlayerTalentRunes (self, other, SPL_PalFullHeal); };
func int TeachPlayerTalentRunes_SPL_PalHolyBolt()				{ return B_TeachPlayerTalentRunes (self, other, SPL_PalHolyBolt); };
func int TeachPlayerTalentRunes_SPL_PalLight()					{ return B_TeachPlayerTalentRunes (self, other, SPL_PalLight); };
func int TeachPlayerTalentRunes_SPL_PalLightHeal()				{ return B_TeachPlayerTalentRunes (self, other, SPL_PalLightHeal); };
func int TeachPlayerTalentRunes_SPL_PalMediumHeal()				{ return B_TeachPlayerTalentRunes (self, other, SPL_PalMediumHeal); };
func int TeachPlayerTalentRunes_SPL_PalRepelEvil()				{ return B_TeachPlayerTalentRunes (self, other, SPL_PalRepelEvil); };
func int TeachPlayerTalentRunes_SPL_PalTeleportSecret()			{ return B_TeachPlayerTalentRunes (self, other, SPL_PalTeleportSecret); };
func int TeachPlayerTalentRunes_SPL_Plague()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Plague); };
func int TeachPlayerTalentRunes_SPL_Pyrokinesis()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis); };
func int TeachPlayerTalentRunes_SPL_Reserved_65()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_65); };
func int TeachPlayerTalentRunes_SPL_Reserved_66()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_66); };
func int TeachPlayerTalentRunes_SPL_Reserved_67()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_67); };
func int TeachPlayerTalentRunes_SPL_Reserved_68()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_68); };
func int TeachPlayerTalentRunes_SPL_Reserved_69()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_69); };
func int TeachPlayerTalentRunes_SPL_Reserved_77()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_77); };
func int TeachPlayerTalentRunes_SPL_Reserved_78()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_78); };
func int TeachPlayerTalentRunes_SPL_Reserved_79()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_79); };
func int TeachPlayerTalentRunes_SPL_Reserved_90()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_90); };
func int TeachPlayerTalentRunes_SPL_Reserved_91()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_91); };
func int TeachPlayerTalentRunes_SPL_Reserved_92()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_92); };
func int TeachPlayerTalentRunes_SPL_Reserved_93()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_93); };
func int TeachPlayerTalentRunes_SPL_Reserved_94()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_94); };
func int TeachPlayerTalentRunes_SPL_Reserved_95()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_95); };
func int TeachPlayerTalentRunes_SPL_Reserved_96()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_96); };
func int TeachPlayerTalentRunes_SPL_Reserved_97()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_97); };
func int TeachPlayerTalentRunes_SPL_Reserved_98()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_98); };
func int TeachPlayerTalentRunes_SPL_Reserved_99()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Reserved_99); };
func int TeachPlayerTalentRunes_SPL_Shrink()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Shrink); };
func int TeachPlayerTalentRunes_SPL_Skull()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Skull); };
func int TeachPlayerTalentRunes_SPL_Sleep()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Sleep); };
func int TeachPlayerTalentRunes_SPL_SuckEnergy()				{ return B_TeachPlayerTalentRunes (self, other, SPL_SuckEnergy); };
func int TeachPlayerTalentRunes_SPL_SummonDemon()				{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon); };
func int TeachPlayerTalentRunes_SPL_SummonGoblinSkeleton()		{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton); };
func int TeachPlayerTalentRunes_SPL_SummonGolem()				{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem); };
func int TeachPlayerTalentRunes_SPL_SummonGuardian()			{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonGuardian); };
func int TeachPlayerTalentRunes_SPL_SummonMud()					{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonMud); };
func int TeachPlayerTalentRunes_SPL_SummonSkeleton()			{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton); };
func int TeachPlayerTalentRunes_SPL_SummonWolf()				{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf); };
func int TeachPlayerTalentRunes_SPL_SummonZombie()				{ return B_TeachPlayerTalentRunes (self, other, SPL_SummonZombie); };
func int TeachPlayerTalentRunes_SPL_Swarm()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Swarm); };
func int TeachPlayerTalentRunes_SPL_TeleportFarm()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportFarm); };
func int TeachPlayerTalentRunes_SPL_TeleportMonastery()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportMonastery); };
func int TeachPlayerTalentRunes_SPL_TeleportOC()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportOC); };
func int TeachPlayerTalentRunes_SPL_TeleportOWDemonTower()		{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportOWDemonTower); };
func int TeachPlayerTalentRunes_SPL_TeleportPassNW()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportPassNW); };
func int TeachPlayerTalentRunes_SPL_TeleportPassOW()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportPassOW); };
func int TeachPlayerTalentRunes_SPL_TeleportSeaport()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportSeaport); };
func int TeachPlayerTalentRunes_SPL_TeleportTaverne()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportTaverne); };
func int TeachPlayerTalentRunes_SPL_TeleportXardas()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TeleportXardas); };
func int TeachPlayerTalentRunes_SPL_Teleport_3()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Teleport_3); };
func int TeachPlayerTalentRunes_SPL_Teleport_Maya()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Teleport_Maya); };
func int TeachPlayerTalentRunes_SPL_Thunderstorm()				{ return B_TeachPlayerTalentRunes (self, other, SPL_Thunderstorm); };
func int TeachPlayerTalentRunes_SPL_TrfDragonSnapper()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfDragonSnapper); };
func int TeachPlayerTalentRunes_SPL_TrfFireWaran()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfFireWaran); };
func int TeachPlayerTalentRunes_SPL_TrfGiantBug()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfGiantBug); };
func int TeachPlayerTalentRunes_SPL_TrfGiantRat()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfGiantRat); };
func int TeachPlayerTalentRunes_SPL_TrfLurker()					{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfLurker); };
func int TeachPlayerTalentRunes_SPL_TrfScavenger()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfScavenger); };
func int TeachPlayerTalentRunes_SPL_TrfShadowbeast()			{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfShadowbeast); };
func int TeachPlayerTalentRunes_SPL_TrfSheep()					{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfSheep); };
func int TeachPlayerTalentRunes_SPL_TrfSnapper()				{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfSnapper); };
func int TeachPlayerTalentRunes_SPL_TrfWaran()					{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfWaran); };
func int TeachPlayerTalentRunes_SPL_TrfWarg()					{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfWarg); };
func int TeachPlayerTalentRunes_SPL_TrfWolf()					{ return B_TeachPlayerTalentRunes (self, other, SPL_TrfWolf); };
func int TeachPlayerTalentRunes_SPL_WaterFist()					{ return B_TeachPlayerTalentRunes (self, other, SPL_WaterFist); };
func int TeachPlayerTalentRunes_SPL_Waterwall()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Waterwall); };
func int TeachPlayerTalentRunes_SPL_Whirlwind()					{ return B_TeachPlayerTalentRunes (self, other, SPL_Whirlwind); };
func int TeachPlayerTalentRunes_SPL_WindFist()					{ return B_TeachPlayerTalentRunes (self, other, SPL_WindFist); };
func int TeachPlayerTalentRunes_SPL_Zap()						{ return B_TeachPlayerTalentRunes (self, other, SPL_Zap); };
