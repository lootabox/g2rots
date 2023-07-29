// ************* 
// G_PickLock
// ----------
// self = Player
// *************

var int LastPickLockNoiseTime;
var int PickLockFailCounter;

func void G_PickLock (var int bSuccess, var int bBrokenOpen)
{
	// Time since last turn
	var int timeDiff; timeDiff = MEM_Timer.totalTime - LastPickLockNoiseTime;
	LastPickLockNoiseTime = MEM_Timer.totalTime;
	
	// Too fast?
	if (timeDiff < 750)
	{ 
		// Double noise without sneak
		if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK)) {
			PickLockFailCounter += 1;
		} else {
			PickLockFailCounter += 2;
		};
	}
	else 
	{ 
		// Not too fast, reduce counter by how many wait periods has passed
		PickLockFailCounter -= (timeDiff / 750);
		if (PickLockFailCounter < 0) {PickLockFailCounter = 0;};
	};

	if (bSuccess)
	{
		if (bBrokenOpen)
		{
			Snd_Play3D 	(self, "PICKLOCK_UNLOCK");
			Print (PRINT_PICKLOCK_UNLOCK);
		}
		else
		{
			Snd_Play3D 	(self, "PICKLOCK_SUCCESS");
			Print (PRINT_PICKLOCK_SUCCESS);
		};
	}
	else
	{
		if (bBrokenOpen)
		{
			Snd_Play3D 	(self, "PICKLOCK_BROKEN");
			Print (PRINT_PICKLOCK_BROKEN);
			var int rnd; rnd = Hlp_Random(100);
			var int sound_chance; sound_chance = 50;
			PickLockFailCounter += 1;
			
			if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
			{
				sound_chance -= 25;
			};
			if (rnd < sound_chance)
			{
				Npc_SendPassivePerc (hero, PERC_ASSESSQUIETSOUND, hero, hero);
				return;
			};
		}
		else
		{
			Snd_Play3D 	(self, "PICKLOCK_FAILURE");
			Print (PRINT_PICKLOCK_FAILURE);
		};
	};
	
	if (PickLockFailCounter > 6)
	{
		Npc_SendPassivePerc (hero, PERC_ASSESSQUIETSOUND, hero, hero);
	};
};
