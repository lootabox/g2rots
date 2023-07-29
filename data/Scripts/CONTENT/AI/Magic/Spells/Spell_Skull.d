// *************
// SPL_Skull	/k5
// *************

const int SPL_Cost_Skull	= 250; 
const int SPL_Damage_Skull 	= 666; 


INSTANCE Spell_Skull	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Skull;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
};

func int Spell_Logic_Skull (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Skull);
};

func void Spell_Cast_Skull()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= C_GetScrollCost(SPL_Cost_Skull);
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
