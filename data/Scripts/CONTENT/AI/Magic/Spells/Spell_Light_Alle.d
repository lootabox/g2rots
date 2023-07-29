// *********
// SPL_Light
// *********

const int SPL_Cost_PalLight			= 1;
const int SPL_Cost_LIGHT			= 5;

const int SPL_Duration_PalLIGHT		= 1;	//fester Wert wird nur für die IT_Runenverwendet (Zeit in Minuten)
const int SPL_Duration_LIGHT		= 1;	//fester Wert wird nur für die IT_Runenverwendet (Zeit in Minuten)	


INSTANCE Spell_Light (C_Spell_Proto)
{
	time_per_mana			= 100; // 500/cost
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_PalLight (C_Spell_Proto)
{
	time_per_mana			= 500; // 500/cost
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


// ------ SPL_PalLight ------
func int Spell_Logic_PalLight(var int manaInvested)
{
	// Extra check for light persister
	if (Buff_Has(self, light_persister))
	{
		return SPL_SENDSTOP;
	};

	// Make sure mana is not reduced (still need to have mana cost because of time_per_mana)
	var int tempMana; tempMana = self.attribute[ATR_MANA];
	var int logicResult; logicResult = Spell_Logic_Invest(self, manaInvested, SPL_Cost_PalLight, 5, FALSE);
	self.attribute[ATR_MANA] = tempMana;

	return logicResult;
};


func void Spell_Cast_PalLight(var int spellLevel)
{
	//Spell_Cast_Basic(self, SPL_Cost_PalLight);
	self.aivar[AIV_SelectSpell] += 1;
	light_persister_apply(self, "spellFX_PalLight_ACTIVE", spellLevel);
};

// ------ SPL_LIGHT ------
func int Spell_Logic_Light(var int manaInvested)
{
	// Extra check for light persister
	if (Buff_Has(self, light_persister))
	{
		return SPL_SENDSTOP;
	};
	return Spell_Logic_Invest(self, manaInvested, SPL_Cost_Light, 5, FALSE);
};

func void Spell_Cast_Light(var int spellLevel)
{
	//Spell_Cast_Basic(self, SPL_Cost_Light);
	self.aivar[AIV_SelectSpell] += 1;
	light_persister_apply(self, "spellFX_Light_ACTIVE", spellLevel);
};
