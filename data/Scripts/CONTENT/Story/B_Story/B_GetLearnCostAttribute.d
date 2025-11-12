// ***********************************************************
// B_GetLearnCostAttribute
// -----------------------
// ermittelt die Kosten eines Attributspunktes (abh. v. Gilde)
// ***********************************************************
	

func int B_GetLearnCostAttribute (var C_NPC oth, var int attribute, var int amount)
{
	// Get current attribute value, without bonuses
	var int current;
		 if (attribute == ATR_STRENGTH)		{ current = oth.aivar[REAL_STRENGTH]; }
	else if (attribute == ATR_DEXTERITY)	{ current = oth.aivar[REAL_DEXTERITY]; }
	else if (attribute == ATR_MANA_MAX)		{ current = oth.aivar[REAL_MANA_MAX]; };

	// Different attributes have different intervals for LP cost increases
	var int interval;				  interval = 20;
	if (attribute == ATR_MANA_MAX)	{ return 2; };

	// Base cost (x amount) based on current attribute value
	var int cost; cost = amount + amount * (current/interval);

	// Extra value may be added near interval threshold to prevent exploiting
	var int extra; extra = (current - interval * (current/interval)) + (amount - interval);
	if (extra > 0) { cost += extra; };
	return cost;
};
