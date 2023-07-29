// *********************
// Alle Transform Spells
// *********************

// All costs are halved since they are scrolls
const int SPL_Cost_TrfSheep			= 5;	//0
const int SPL_Cost_TrfGiantRat		= 10;	//4
const int SPL_Cost_TrfScavenger		= 20;	//7
const int SPL_Cost_TrfWolf			= 30;	//6
const int SPL_Cost_TrfGiantBug		= 30;	//8
const int SPL_Cost_TrfLurker		= 40;	//10
const int SPL_Cost_TrfWaran			= 40;	//12
const int SPL_Cost_TrfSnapper		= 50;	//18
const int SPL_Cost_TrfWarg			= 60;	//15?!
const int SPL_Cost_TrfDragonSnapper	= 70;	//20
const int SPL_Cost_TrfFireWaran		= 80;	//21
const int SPL_Cost_TrfShadowbeast	= 100;	//20

// ------ Instanz für alle Transform-Sprüche ------
INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
	canTurnDuringInvest		= 0;
};

// ------ Schaf ------
func int Spell_Logic_TrfSheep (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
		B_TransformStart(SPL_TrfSheep);
		Npc_SetActiveSpellInfo(self, SheepTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Scavenger ------
func int Spell_Logic_TrfScavenger (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfScavenger;
		B_TransformStart(SPL_TrfScavenger);
		Npc_SetActiveSpellInfo(self, ScavengerTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Giant Rat ------
func int Spell_Logic_TrfGiantRat (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantRat)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantRat;
		B_TransformStart(SPL_TrfGiantRat);
		Npc_SetActiveSpellInfo(self, Giant_RatTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};


// ------ Giant BUG ------
func int Spell_Logic_TrfGiantBug (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantBug;
		B_TransformStart(SPL_TrfGiantBug);
		Npc_SetActiveSpellInfo(self, Giant_BugTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Wolf ------
func int Spell_Logic_TrfWolf (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWolf;
		B_TransformStart(SPL_TrfWolf);
		Npc_SetActiveSpellInfo(self, WolfTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Waran ------
func int Spell_Logic_TrfWaran (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWaran;
		B_TransformStart(SPL_TrfWaran);
		Npc_SetActiveSpellInfo(self, WaranTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Snapper ------
func int Spell_Logic_TrfSnapper (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
		B_TransformStart(SPL_TrfSnapper);
		Npc_SetActiveSpellInfo(self, SnapperTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Warg ------
func int Spell_Logic_TrfWarg (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;
		B_TransformStart(SPL_TrfWarg);
		Npc_SetActiveSpellInfo(self, WargTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Feuerwaran ------
func int Spell_Logic_TrfFireWaran (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfFireWaran;
		B_TransformStart(SPL_TrfFireWaran);
		Npc_SetActiveSpellInfo(self, FireWaranTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Lurker ------
func int Spell_Logic_TrfLurker (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfLurker;
		B_TransformStart(SPL_TrfLurker);
		Npc_SetActiveSpellInfo(self, LurkerTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Shadowbeast ------
func int Spell_Logic_TrfShadowbeast (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
		B_TransformStart(SPL_TrfShadowbeast);
		Npc_SetActiveSpellInfo(self, ShadowbeastTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Dragon Snapper ------
func int Spell_Logic_TrfDragonSnapper (var int manaInvested)
{
	if (self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfDragonSnapper;
		B_TransformStart(SPL_TrfDragonSnapper);
		Npc_SetActiveSpellInfo(self, DragonSnapperTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};





