// ***************
// SPL_Pyrokinesis  ALIAS  ChargeFireStorm
// ***************

const int SPL_Cost_Firestorm		= 30; //*4
const int SPL_Damage_FireStorm 		= 75;

	// obsolete:
	const int SPL_PYRO_DAMAGE_PER_SEC = 20;	// wird in ZS_Pyro (Pyrokinese-Opfer) benutzt, dort KEIN Rùstungsschutz!
	////////////

INSTANCE Spell_Pyrokinesis (C_Spell_Proto)
{
	time_per_mana			= 33; // 1000/cost
	damage_per_level		= SPL_Damage_FireStorm;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Pyrokinesis (var int manaInvested)
{
	return Spell_Logic_Invest(self, manaInvested, SPL_Cost_Firestorm, 4, FALSE);
};

func void Spell_Cast_Pyrokinesis(var int spellLevel)
{	
	self.aivar[AIV_SelectSpell] += 1;
};
