var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//z�hl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 1; //Start
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erh�he die Anzahl der n�tigen Opfer zum n�chsten Level (aktuelleOpfer + aktueller Level)
		
		//Platz f�r Goodies (Items, Attributes...) 
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
