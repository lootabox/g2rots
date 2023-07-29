var int Rupert_ItemsGiven_Chapter_1;
var int Rupert_ItemsGiven_Chapter_2;
var int Rupert_ItemsGiven_Chapter_3;
var int Rupert_ItemsGiven_Chapter_4;
var int Rupert_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Rupert (var C_NPC slf)
{
	if((Kapitel >= 1) && (Rupert_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,3);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Milk, 2);
		CreateInvItems(slf,ItFo_Water,2);
		CreateInvItems(slf,ItFoMutton,2);
		CreateInvItems(slf,ItFo_Cheese,1);

		CreateInvItems(slf,ItPl_Beet,6);
		CreateInvItems(slf,ItPl_Forestberry,1);
		CreateInvItems(slf,ItPl_Planeberry,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,1);
		CreateInvItems(slf,ItPl_Health_Herb_02,1);

		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItLsTorch,3);
		
		CreateInvItems(slf,ItMi_Pan,2);
		CreateInvItems(slf,ItMi_Brush,2);
		CreateInvItems(slf,ItMi_Scoop,2);

		Rupert_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Rupert_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,3);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Water,2);
		CreateInvItems(slf,ItFoMutton,2);
		CreateInvItems(slf,ItFo_Sausage,2);

		CreateInvItems(slf,ItPl_Beet,5);
		CreateInvItems(slf,ItPl_Forestberry,2);
		CreateInvItems(slf,ItPl_Planeberry,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,2);
		CreateInvItems(slf,ItPl_Health_Herb_02,1);

		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItLsTorch,3);
		
		Rupert_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Rupert_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,3);
		CreateInvItems(slf,ItFo_Milk, 3);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItFo_Cheese,1);

		CreateInvItems(slf,ItPl_Beet,4);
		CreateInvItems(slf,ItPl_Forestberry,3);
		CreateInvItems(slf,ItPl_Planeberry,2);
		CreateInvItems(slf,ItPl_Health_Herb_01,2);
		CreateInvItems(slf,ItPl_Health_Herb_02,2);

		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItSc_MediumHeal,1);
		CreateInvItems(slf,ItLsTorch,3);
		Rupert_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Rupert_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,3);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Water,2);
		CreateInvItems(slf,ItFoMutton,2);
		CreateInvItems(slf,ItFo_Sausage,2);

		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPl_Forestberry,4);
		CreateInvItems(slf,ItPl_Planeberry,2);
		CreateInvItems(slf,ItPl_Health_Herb_01,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,2);

		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItSc_MediumHeal,1);
		CreateInvItems(slf,ItLsTorch,3);
		Rupert_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Rupert_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,3);
		CreateInvItems(slf,ItFo_Milk, 3);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItFo_Cheese,1);

		CreateInvItems(slf,ItPl_Beet,2);
		CreateInvItems(slf,ItPl_Forestberry,5);
		CreateInvItems(slf,ItPl_Planeberry,3);
		CreateInvItems(slf,ItPl_Health_Herb_01,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);

		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItSc_MediumHeal,1);
		CreateInvItems(slf,ItLsTorch,3);
		Rupert_ItemsGiven_Chapter_5 = TRUE;
	};
};



