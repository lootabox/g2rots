func void B_ClearAlchemyInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,ItMi_Flask,Npc_HasItems(slf,ItMi_Flask));
	};
};