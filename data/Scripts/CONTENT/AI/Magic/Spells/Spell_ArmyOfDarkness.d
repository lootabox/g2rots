// ******************
// SPL_ArmyOfDarkness
// ******************

const int SPL_Cost_ArmyOfDarkness	= 30;


INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana			= 11; // 333/cost
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};


func int Spell_Logic_ArmyOfDarkness (var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_ArmyOfDarkness, 9);
};

// NEU:
// einige Spells haben Probleme logische Aktionen mit den Animationen
// zu synchronisieren. In diesem Beispiel w�rden, wenn die folgenden Befehle
// direkt vor dem SPL_SENDCAST st�nden, die Skelette gespawned werden, bevor
// �berhaupt eine Investier- oder Cast- Ani angespielt ist.
// Darum gibt es ab Version 1.16b optional die M�glichkeit, etwaige Aktionen
// mit den Anis zu synchronisieren. Daf�r muss dann eine SkriptFunktion 
// Spell_Cast_SPELLNAME existieren, die aufgerufen wird, sobald alle Magie Animationen
// beendet wurden
func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	Spell_Cast_Summon(self, Summoned_Skeleton_Evil, Summoned_Skeleton, spellLevel);
};
