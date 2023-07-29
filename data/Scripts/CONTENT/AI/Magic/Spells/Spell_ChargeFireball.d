// ******************
// SPL_ChargeFireball
// ******************

const int SPL_Cost_ChargeFireball		= 20; //*4
const int SPL_Damage_ChargeFireball 	= 75;

INSTANCE Spell_ChargeFireball (C_Spell_Proto)
{
	time_per_mana			= 50; // 1000/cost
	damage_per_level		= SPL_Damage_ChargeFireball;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_ChargeFireball (var int manaInvested) 
{
	return Spell_Logic_Invest(self, manaInvested, SPL_Cost_ChargeFireball, 4, FALSE);
};

func void Spell_Cast_ChargeFireball(var int spellLevel)
{
	self.aivar[AIV_SelectSpell] += 1;
};
