// ******************************************************************
// B_AssessMagic
// -------------
// Wahrnehmung ist für ALLE NSCs IMMER aktiv
// auch für den Spieler (s.u.)
// wir aufgerufen, sobald irgendein Spruch auf einen NSC wirkt
// setzt den NSC dan in den entsprechenden ZS
// die meisten Spells führen allerdings zu keinem ZS
// (sind unten nicht berücksichtigt)
// ------------------------------------------------------------------
// Beachtem: if (Npc_GetActiveSpell(other) == SPL_Sleep) funzt nicht,
// weil Sleep INSTANT wirkt (d.h. sofort SENDCAST zurückliefert)
// und beim Aufruf von B_AssessMagic NICHT mehr "Active" ist!
// ******************************************************************

const int COLL_DONOTHING			= 0;
const int COLL_DOEVERYTHING			= 1<<0;
const int COLL_APPLYDAMAGE			= 1<<1;
const int COLL_APPLYHALVEDAMAGE		= 1<<2;
const int COLL_APPLYDOUBLEDAMAGE	= 1<<3;
const int COLL_APPLYVICTIMSTATE		= 1<<4;
const int COLL_DONTKILL				= 1<<5;


func int C_CanNpcCollideWithSpell(var int spellType)
{

	// GFA: Do not damage beyond maximum fighting range (AI does not react)
	if (Npc_GetDistToNpc(self, other) > FIGHT_DIST_CANCEL) {
		return COLL_DONOTHING;
	};

	//#################
	//###	Addon	###
	//#################

	//###	KDW	###

	//----- Whirlwind ----- (Animated)
	if (spellType == SPL_Whirlwind)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (C_NpcIsGolem(self))
		|| (self.guild == GIL_DEMON)
		|| (self.guild == GIL_SUMMONED_DEMON)
		|| (self.guild == GIL_TROLL)
		|| (self.guild == GIL_DRAGON)
		|| (self.flags == NPC_FLAG_IMMORTAL)
		|| (self.guild == GIL_SHADOWBEAST)
		|| (self.guild == GIL_GARGOYLE)
		{
			return COLL_DONOTHING;
		};
		
		if (C_NpcIsGateGuard (self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};
		
		return COLL_DOEVERYTHING;
	};

	//----- Geyser -----
	//----- Waterfist -----
	if (spellType == SPL_Geyser)
	|| (spellType == SPL_Waterfist)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};

		if (C_NpcIsLarge(self))
		{
			return COLL_APPLYDAMAGE | COLL_DONTKILL;
		};
		
		return COLL_APPLYDAMAGE | COLL_APPLYVICTIMSTATE | COLL_DONTKILL;
	};

	//###	Beliar	###

	// ---- Energyball -----
	if (spellType == SPL_EnergyBall)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};

		if (C_NpcIsEvil(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		
		return COLL_DOEVERYTHING;
	};



	// ---- Suck Energy ---- (Animated)
	if (spellType == SPL_SuckEnergy)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (self.guild > GIL_SEPERATOR_HUM)
		|| (self.flags == NPC_FLAG_IMMORTAL)  
		|| (Npc_GetDistToNpc (self,other) > 1000)
		|| (self.guild == GIL_DMT)
		{
			return COLL_DONOTHING;
		};
		
		return COLL_DOEVERYTHING;
	};


	// ---- GreenTentacle ---- (Animated)
	if (spellType == SPL_GreenTentacle)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (C_NpcIsGateGuard (self) == TRUE)
		|| (C_NpcIsGolem(self))
		|| (self.guild == GIL_DEMON)
		|| (self.guild == GIL_SUMMONED_DEMON)
		|| (self.guild == GIL_TROLL)
		|| (self.guild == GIL_DRAGON)
		|| (self.guild == GIL_BLOODFLY)
		|| (self.guild == GIL_Gargoyle)
		|| (self.guild == GIL_HARPY)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};

	// ---- Swarm ---- (Animated)
	if (spellType == SPL_Swarm)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (C_NpcIsGolem(self))
		|| (self.guild == GIL_DEMON)
		|| (self.guild == GIL_SUMMONED_DEMON)
		|| (self.guild == GIL_TROLL)
		|| (self.guild == GIL_DRAGON)
		|| (self.guild == GIL_BLOODFLY)
		|| (self.guild == GIL_Gargoyle)
		|| (self.guild == GIL_DMT)
		|| (C_NpcIsUndead (self) == TRUE)
		{
			return COLL_DONOTHING;
		};
		
		if (self.guild > GIL_SEPERATOR_HUM)
		|| (C_NpcIsGateGuard (self)== TRUE)
		{
			return COLL_APPLYDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};

	// ---- Skull ----
	if (spellType == SPL_Skull)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (C_NpcIsUndead(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};


	//####################
	//###	Gothic2	   ###
	//####################

	// --- Windfist ---
	if (spellType == SPL_WINDFIST)
	{
		if (Npc_GetDistToNpc (other,self) >= 1000)
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};

	// ------ Sonderfall: Dmt ------
	if (other.guild == GIL_DMT)
	{
		if (self.guild == GIL_DMT)
		{
			if (spellType == SPL_Firerain)
			|| (spellType == SPL_Thunderstorm)
			|| (spellType == SPL_LightningFlash)
			|| (spellType == SPL_Firestorm)
			{
				return COLL_DONOTHING;
			};
		};
	};

	// ------ Sonderfall: Firegolem ------
	if (other.guild == GIL_DRACONIAN)
	{
		if (self.guild == GIL_FIREGOLEM)
		{
			if (spellType == SPL_Firestorm)
			{
				return COLL_DONOTHING;
			};
		};
	};

	//----- Feuer ------
	if (spellType 	== SPL_ChargeFireball)
	|| (spellType  	== SPL_InstantFireball)
	|| (spellType  	== SPL_Firerain)
	|| (spellType 	== SPL_Firebolt)
	|| (spellType 	== SPL_Firestorm)
	|| (spellType   == SPL_Pyrokinesis)
	|| (spellType	== SPL_Deathbolt)
	|| (spellType 	== SPL_Deathball)
	{
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};

		// Collision burn FX is handled by damage script
		//return COLL_DOEVERYTHING;
		return COLL_APPLYDAMAGE;
	};
	
	//----- Eis -----
	if (spellType == SPL_IceCube)
	|| (spellTYpe == SPL_IceWave)
	|| (spellType == SPL_Icebolt)
	|| (spellType == SPL_Icelance)
	|| (spellType == SPL_Thunderstorm)
	{
		// wenn im schwimm oder tauchmodus, bewirkt der spell nix
		if (C_NpcIsDown(self))
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		
		// large monsters cant be frozen
		if (C_NpcIsLarge(self)) //andere
		{
			return COLL_APPLYDAMAGE;
		};
		
		return COLL_DOEVERYTHING;
	};

	//----- Blitz -----	
	if (spellType == SPL_Zap)
	|| (spellType == SPL_ChargeZap)
	|| (spellType == SPL_LightningFlash)
	|| (spellType == SPL_Concussionbolt)
	{
		if (C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		
		// Check for APPLYVICTIMSTATE
		var int applyState; applyState = COLL_DONOTHING;
		if	(!C_NpcIsUndead(self))
		&&	(!C_NpcIsGolem(self))
		&&	(self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
		{
			applyState = applyState | COLL_APPLYVICTIMSTATE;
		};

		if (spellType == SPL_LightningFlash)
		|| (C_BodyStateContains(self,BS_SWIM))
		|| (C_BodyStateContains(self,BS_DIVE))
		|| (GetWaterLevel(self) == WATERLEVEL_WADE)
		{
			return COLL_APPLYDAMAGE | applyState;
		}
		else
		{
			return COLL_APPLYDAMAGE | COLL_DONTKILL | applyState;
		};
	};

	//------ Angst -----
	/* if (spellType == SPL_Fear)
	{
		if (!C_NpcIsLarge(self) && !C_NpcIsGolem(self) && !C_NpcIsUndead(self) && C_NpcIsImmuneToMindSpells(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	}; */

	// ---- Untote vernichten ----
	if (spellType == SPL_DestroyUndead)
	{
		if (C_NpcIsUndead(self))
		{	
			if (self.attribute[ATR_HITPOINTS] + self.protection[PROT_MAGIC] <= SPL_Damage_DestroyUndead)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};

	// ---- Todeshauch ----
	if (spellType == SPL_BreathOfDeath)
	{
		if (Npc_GetDistToNpc (other,self) < 1000)
		&& (!C_NpcIsUndead(self))
		{
			if (self.attribute[ATR_HITPOINTS] + self.protection[PROT_MAGIC] <= SPL_Damage_BreathOfDeath)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};

	// ---- Todeswelle ----
	if (spellType == SPL_MassDeath)
	{
		if (!C_NpcIsUndead(self))
		{
			if (self.attribute[ATR_HITPOINTS] + self.protection[PROT_MAGIC] <= SPL_Damage_MassDeath)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};

	// ---- Finaler Spruch ----
	if (spellType 	== SPL_MasterOfDisaster)
	{
		if (!C_NpcIsDown(self))
		&& (!C_BodyStateContains(self,BS_SWIM))
		&& (!C_BodyStateContains(self,BS_DIVE))
		&& (C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};

	//----- Paladin Sprüche -----	
	if (spellType == SPL_PalHolyBolt)
	{
		if (C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_APPLYHALVEDAMAGE;
	}
	else if (spellType == SPL_PalRepelEvil)
	{
		// Only evil, unharmed, non-large
		if (C_NpcIsEvil(self))
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				if (!C_NpcIsLarge(self) && !C_NpcIsGolem(self) && !C_NpcIsUndead(self) && (self.guild != GIL_DMT))
				{
					return COLL_DOEVERYTHING;
				};
			};
			return COLL_APPLYDAMAGE;
		};
		return COLL_DONOTHING;
	}
	else if (spellType == SPL_PalDestroyEvil)
	{
		if (C_NpcIsEvil(self))
		{
			if (self.attribute[ATR_HITPOINTS] + self.protection[PROT_MAGIC] <= SPL_Damage_PalDestroyEvil + other.attribute[ATR_MANA_MAX]*SPL_Cost_PalDestroyEvil*2/100)
			{
				return COLL_DOEVERYTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	
	//----- Alle anderen -----
	return COLL_DOEVERYTHING;
};

