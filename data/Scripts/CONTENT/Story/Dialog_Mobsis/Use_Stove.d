
//*******************************************************
//	Pan Dialog abbrechen
//*******************************************************
INSTANCE PC_USE_STOVE_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_USE_STOVE_End_Condition;
	information		= PC_USE_STOVE_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};
FUNC INT PC_USE_STOVE_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_USE_STOVE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_USE_STOVE_End_Info()
{
	CreateInvItems (self, ItMiSwordRaw,1);
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
func int C_FryMeat(var int rawInstance, var int amount)
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_USE_STOVE)
	&& (Npc_HasItems(self, rawInstance) >= amount)
	{
		return TRUE;
	};
};
//*******************************************************
func void B_FryMeat(var string rawName, var int rawInstance, var int friedInstance, var int amount)
{
	CreateInvItems(self, friedInstance, amount);
	Npc_RemoveInvItems(self, rawInstance, amount);

	// "Frying <raw>..."
	var string s; s = ConcatStrings("Frying ", rawName);
	s = ConcatStrings(s, "...");
	Print(s);

	var float waittime; waittime = IntToFloat(1 + amount/5);
	AI_Wait(self, waittime);

	// "x piece(s)"
	s = ConcatStrings(IntToString(amount), " piece");
	if (amount > 1) { s = ConcatStrings(s, "s"); };

	// " of <raw> fried"
	s = ConcatStrings(s, " of ");
	s = ConcatStrings(s, rawName);
	s = ConcatStrings(s, " fried");

	AI_PrintScreen(s, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	if (!Npc_HasItems(self, rawInstance))
	{
		B_ENDPRODUCTIONDIALOG ();
	};
};
//*******************************************************
instance PC_USE_STOVE_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_USE_STOVE_1_CONDITION;
	information = PC_USE_STOVE_1_INFO;
	important = FALSE;
	permanent = TRUE;
	description = "Fry 1 Raw Meat.";
};
func int PC_USE_STOVE_1_CONDITION()	{ return C_FryMeat(ItFoMuttonRaw, 1); };
func void PC_USE_STOVE_1_INFO()		{ B_FryMeat("Raw Meat", ItFoMuttonRaw, ItFoMutton, 1); };
//*******************************************************
instance PC_USE_STOVE_5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_USE_STOVE_5_CONDITION;
	information = PC_USE_STOVE_5_INFO;
	important = FALSE;
	permanent = TRUE;
	description = "Fry 5 Raw Meat.";
};
func int PC_USE_STOVE_5_CONDITION()	{ return C_FryMeat(ItFoMuttonRaw, 5); };
func void PC_USE_STOVE_5_INFO()		{ B_FryMeat("Raw Meat", ItFoMuttonRaw, ItFoMutton, 5); };
//*******************************************************
instance PC_USE_STOVE_10(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_USE_STOVE_10_CONDITION;
	information = PC_USE_STOVE_10_INFO;
	important = FALSE;
	permanent = TRUE;
	description = "Fry 10 Raw Meat.";
};
func int PC_USE_STOVE_10_CONDITION()	{ return C_FryMeat(ItFoMuttonRaw, 10); };
func void PC_USE_STOVE_10_INFO()		{ B_FryMeat("Raw Meat", ItFoMuttonRaw, ItFoMutton, 10); };
//*******************************************************
instance PC_USE_STOVE_20(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_USE_STOVE_20_CONDITION;
	information = PC_USE_STOVE_20_INFO;
	important = FALSE;
	permanent = TRUE;
	description = "Fry 20 Raw Meat.";
};
func int PC_USE_STOVE_20_CONDITION()	{ return C_FryMeat(ItFoMuttonRaw, 20); };
func void PC_USE_STOVE_20_INFO()		{ B_FryMeat("Raw Meat", ItFoMuttonRaw, ItFoMutton, 20); };
//*******************************************************
instance PC_USE_STOVE_ALL(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_USE_STOVE_ALL_CONDITION;
	information = PC_USE_STOVE_ALL_INFO;
	important = FALSE;
	permanent = TRUE;
	description = "Fry all Raw Meat.";
};
func int PC_USE_STOVE_ALL_CONDITION()	{ return C_FryMeat(ItFoMuttonRaw, 2); };
func void PC_USE_STOVE_ALL_INFO()		{ B_FryMeat("Raw Meat", ItFoMuttonRaw, ItFoMutton, Npc_HasItems(self, ItFoMuttonRaw)); };
//*******************************************************
func void USE_STOVE_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_USE_STOVE;

		// Undo automatically fried meat
		CreateInvItems(self, ItFoMuttonRaw, 1);
		Npc_RemoveInvItems(self, ItFoMutton, 1);

		AI_ProcessInfos(her);
	};
};
