// ******************
// SPL_ArmyOfDarkness
// ******************

const int SPL_Cost_ArmyOfDarkness	= 60;


INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana			= 	0;
	targetCollectAlgo		= 	TARGET_COLLECT_NONE;
};


func int Spell_Logic_ArmyOfDarkness (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_ArmyOfDarkness);
};

// NEU:
// einige Spells haben Probleme logische Aktionen mit den Animationen
// zu synchronisieren. In diesem Beispiel würden, wenn die folgenden Befehle
// direkt vor dem SPL_SENDCAST stünden, die Skelette gespawned werden, bevor
// überhaupt eine Investier- oder Cast- Ani angespielt ist.
// Darum gibt es ab Version 1.16b optional die Möglichkeit, etwaige Aktionen
// mit den Anis zu synchronisieren. Dafür muss dann eine SkriptFunktion 
// Spell_Cast_SPELLNAME existieren, die aufgerufen wird, sobald alle Magie Animationen
// beendet wurden
func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	if (Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange	(self,	Summoned_Skeleton,			6,	800);
	}
	else
	{
		Wld_SpawnNpcRange	(self,	Skeleton,			6,	800);
	};
	
	Spell_Cast_Basic(self, SPL_Cost_ArmyOfDarkness);
};
