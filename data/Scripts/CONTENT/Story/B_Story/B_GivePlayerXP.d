// **************
// B_GivePlayerXP
// **************

var int PlayerLevelsDuringTransform;

func int GetHitpointGainPerLevel()
{
	return HP_PER_LEVEL * (4 - hitpointGainPerLevel) / 4;
};

func void B_GivePlayerXP (var int add_xp)
{
	if (add_xp == 0) { return; };
	if (hero.level == 0)
	{
		hero.exp_next = 500;
	};
	if(hero.attribute[ATR_HITPOINTS] > 0)
	{
		//----------------------------------------------------------------------------
		hero.exp = hero.exp + add_xp;

		//----------------------------------------------------------------------------
		var string concatText;
		concatText = PRINT_XPGained;
		concatText = ConcatStrings (concatText,	IntToString(add_xp));
		PrintScreen	(concatText, -1, YPOS_XPGained, FONT_ScreenSmall, 2);

		//----------------------------------------------------------------------------
		if ( hero.exp >= hero.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
		{
			// if transformed, hitpoints increase must be delayed and level will be wrong
			if(PlayerIsTransformed == TRUE)
			{
				PlayerLevelsDuringTransform += 1;
				hero.exp_next += (hero.aivar[REAL_LEVEL] + PlayerLevelsDuringTransform + 1)*500;
			}
			else
			{
				hero.aivar[REAL_LEVEL]				+= 1;
				hero.level							+= 1;
				hero.exp_next						+= (hero.level+1)*500;
				hero.attribute[ATR_HITPOINTS_MAX]	+= GetHitpointGainPerLevel();
				hero.attribute[ATR_HITPOINTS]		+= GetHitpointGainPerLevel();
			};
			hero.LP += LP_PER_LEVEL;
			
			PrintScreen (PRINT_LevelUp, -1, YPOS_LevelUp, FONT_Screen, 2);
			Snd_Play ("LevelUp");
		};
	};
	B_Checklog ();
};








