/*
 *	Fade away
 *
 *	1. Copy this file outside of script-packet
 *	2. Customize it
 *	3. Link it to Gothic.src
 *	4. Profit
 */

//Should Npc drop weapon?
const int FADEAWAY_DROPWEAPON = 0; // FALSE

//Should Npc drop inventory?
const int FADEAWAY_DROPINVENTORY = 0; // FALSE
const int FADEAWAY_DONTDROPFLAGS = 0; // FALSE
const int FADEAWAY_DONTDROPMAINFLAG = 0; // FALSE

const string FADEAWAY_ITEMSLOTNAME = "BIP01";

/** Function must have this name. */
func int C_Npc_IsSummoned(var C_NPC slf) {
	if (slf.guild == GIL_SUMMONED_WOLF)
	|| (slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
	|| (slf.guild == GIL_SUMMONED_SKELETON)
	//|| (slf.guild == GIL_SUMMONED_GOLEM)
	|| (slf.guild == GIL_SUMMONED_DEMON)
	{
		return 1; // TRUE
	};

	return 0; // FALSE
};
