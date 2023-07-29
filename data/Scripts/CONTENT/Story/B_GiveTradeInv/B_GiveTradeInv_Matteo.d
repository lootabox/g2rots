var int Matteo_ItemsGiven_Chapter_1;
var int Matteo_ItemsGiven_Chapter_2;
var int Matteo_ItemsGiven_Chapter_3;
var int Matteo_ItemsGiven_Chapter_4;
var int Matteo_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Matteo (var C_NPC slf)
{
	if((Kapitel >= 1) && (Matteo_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_Nagelkeule,1);
		CreateInvItems(slf,ItMw_Nagelkeule2,1);
		CreateInvItems(slf,ItMw_Sense,1);
		CreateInvItems(slf,ItMw_1h_Bau_Axe,1);
		CreateInvItems(slf,ItMw_1H_Mace_L_03,1);
		CreateInvItems(slf,ItMw_1H_Mace_L_01,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Dagger,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(slf,ItMw_2h_Bau_Axe,1);

		CreateInvItems(slf,ItLsTorch,5);
		CreateInvItems(slf,ItRw_Arrow,15);
		CreateInvItems(slf,ItRw_Bolt,15);
		
		CreateInvItems(slf,ItFo_Stew,3);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Milk, 3);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItPo_Mana_01,1);
		CreateInvItems(slf,ItPo_Health_01,1);

		CreateInvItems(slf,ItSc_Firebolt,2);
		CreateInvItems(slf,ItSc_Zap,2);
		CreateInvItems(slf,ItSc_Icebolt,2);
		CreateInvItems(slf,ItSc_Sleep,1);
		CreateInvItems(slf,ItSc_LightHeal,1);

		CreateInvItems(slf,ItMi_Hammer,3);
		CreateInvItems(slf,ItMi_Saw,2);
		CreateInvItems(slf,ItMi_Pan,3);
		CreateInvItems(slf,ItMi_Lute,1);
		CreateInvItems(slf,ItMi_Broom,2);
		CreateInvItems(slf,ItMi_Stomper,2);

		Matteo_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Matteo_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMw_Stabkeule,1);
		CreateInvItems(slf,ItLsTorch,5);
		CreateInvItems(slf,ItPl_Forestberry,3);
		CreateInvItems(slf,ItFo_Stew,2);
		CreateInvItems(slf,ItFo_Sausage,2);
		CreateInvItems(slf,ItFo_Water,2);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItPo_Health_01,1);
		Matteo_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Matteo_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMw_Spicker,1);
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItLsTorch,5);
		CreateInvItems(slf,ItPl_Forestberry,3);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Bacon,1);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItPo_Mana_01,1);
		Matteo_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Matteo_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItFo_Sausage,2);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItPo_Health_02,1);
		Matteo_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Matteo_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItFo_Bacon,1);
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItRw_Arrow,20);
		CreateInvItems(slf,ItRw_Bolt,20);
		CreateInvItems(slf,ItPo_Mana_01,1);
		CreateInvItems(slf,ItPo_Health_02,1);
		Matteo_ItemsGiven_Chapter_5 = TRUE;
	};
};
