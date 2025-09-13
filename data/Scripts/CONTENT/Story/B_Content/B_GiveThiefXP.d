var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//zähl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 1; //Start
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erhöhe die Anzahl der nötigen Opfer zum nächsten Level (aktuelleOpfer + aktueller Level)
		
		//Platz für Goodies (Items, Attributes...) 
	};
		
		//-------------------XP-----------------------
		
		B_GivePlayerXP (ThiefLevel * 10);  
};
//------------------------------------------------------------------ 
//FUNC VOID B_ResetThiefLevel()
//{
//
//	
//	if (VictimCount > ThiefLevel)
//	{
//		VictimCount = (VictimCount - 1); 
//	};
//	
//	
//};
