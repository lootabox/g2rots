// *********
// SPL_Charm
// *********

const int SPL_Cost_Charm		= 10;


INSTANCE Spell_Charm(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;
	spelltype 				= SPELL_NEUTRAL;
};

func int Spell_Logic_Charm(var int manaInvested)
{
	var int logicResult; logicResult = Spell_Logic_Basic(self, SPL_Cost_Charm);
	if (logicResult == SPL_SENDCAST)
	{
		//---STORY: Ignaz-Mission-----------------------------
		if (other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE)
		&& (MIS_Ignaz_Charm == LOG_RUNNING)
		&& (Charm_Test == FALSE)
		{
			B_LogEntry(TOPIC_Ignaz,"It seems the spell worked! I should tell Ignaz about it.");
			Charm_Test = TRUE;
		};
		//----------------------------------------------------
			
		B_DeletePetzCrime (other); ///hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
 		other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
 		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
 		
 		// ------ Opfer (other) ist nicht GILDEN-Hostile zu other ------
		if (Wld_GetGuildAttitude(other.guild, self.guild) != ATT_HOSTILE)
		{	
			// ------ ABER temp_hostile (d.h. hat gerade gegen den Spieler gekämpft) ------
			if (Npc_GetAttitude (other, self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other, Wld_GetGuildAttitude(other.guild, self.guild));
			};
		};
	};
	return logicResult;
};

func void Spell_Cast_Charm()
{
	Spell_Cast_Basic(self, SPL_Cost_Charm);
};
