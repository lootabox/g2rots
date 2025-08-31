// *****************************************************
// Waffen in der Welt (ab Kapitel 1)
// ---------------------------------
// Hier alle Waffen, die bei mortal-NSCs 
// oder in die Welt objektiert zu finden sind
// Alle haben sehr geringen Wert
// Alle können (theoretisch) in Kapitel 1 erlangt werden
// *****************************************************

const int Waffenbonus_01 =  1;
const int Waffenbonus_02 =  2;
const int Waffenbonus_03 =  3;
const int Waffenbonus_04 =  4;
const int Waffenbonus_05 =  5;
const int Waffenbonus_06 =  6;
const int Waffenbonus_07 =  7;
const int Waffenbonus_08 =  8;
const int Waffenbonus_09 =  9;
const int Waffenbonus_10 = 10;
const int Waffenbonus_30 = 30;
// *****************************************************
//Dolch - ItMw_1h_Vlk_Dagger
const int Damage_VLKDolch				= 10; 
const int Condition_VLKDolch			= 10;
const int Range_VLKDolch				= 50;
const int Value_VLKDolch				= 5;  
//Schürhaken - ItMw_1H_Mace_L_01    
const int Damage_Schuerhaken 			= 10; // 5
const int Condition_Schuerhaken			= 10; // 5
const int Range_Schuerhaken				= 50;
const int Value_Schuerhaken				= 5; 
//Sichel - ItMw_1h_Bau_Axe    
const int Damage_BauAxe					= 7; 
const int Condition_BauAxe				= 5;
const int Range_BauAxe					= 50;
const int Value_BauAxe					= 10; 
//Goldene Sichel - ItMw_1h_Bau_Axe    
//const int Damage_Sichel01				= 15; 
//const int Condition_Sichel01			= 5;
//const int Range_Sichel01				= 50;
//const int Value_Sichel01				= 200; 
//Gehstock - ItMw_1h_Vlk_Mace    
const int Damage_VLKMace 				= 8; 
const int Condition_VLKMace				= 5;
const int Range_VLKMace					= 70;
const int Value_VLKMace					= 10; 
//Belegnagel - ItMw_1H_Mace_L_03    
const int Damage_Belegnagel 			= 8; 
const int Condition_Belegnagel			= 10;
const int Range_Belegnagel				= 70;
const int Value_Belegnagel				= 5; 
//schwerer Ast - ItMw_1h_Bau_Mace    
const int Damage_BauMace				= 5; //10
const int Condition_BauMace				= 5; //10
const int Range_BauMace					= 70;
const int Value_BauMace					= 1; 
//Holzkeule - ItMw_1h_Bau_Mace //ADDON  
const int Damage_Windknecht				= 15; 
const int Condition_Windknecht			= 25;
const int Range_Windknecht				= 65;
const int Value_Windknecht				= 25; 
//Steinkeule - ItMw_1h_Bau_Mace //ADDON  
//const int Damage_Steinkeule				= 25; 
//const int Condition_Steinkeule			= 15;
//const int Range_Steinkeule				= 65;
//const int Value_Steinkeule				= 50; 
//Beil 		- ItMw_1h_Vlk_Axe    
const int Damage_VLKAxe					= 10; 
const int Condition_VLKAxe				= 10; 
const int Range_VLKAxe					= 50;
const int Value_VLKAxe					= 200; 
//Schmiedehammer - ItMw_1H_Mace_L_04
const int Damage_Schmiedehammer 		= 10; 
const int Condition_Schmiedehammer		= 10;
const int Range_Schmiedehammer			= 30;
const int Value_Schmiedehammer			= 200;
//Kurzschwert der Miliz - MILIZ - NEUE INSTANZ
const int Damage_ShortSword1 			= 16; //10
const int Condition_ShortSword1			= 10;
const int Range_ShortSword1				= 50;
const int Value_ShortSword1				= 500;
// Nagelknüppel - für BANDITEN - NEUE INSTANZ 
const int Damage_Nagelknueppel			= 12; 
const int Condition_Nagelknueppel		= 10;
const int Range_Nagelknueppel			= 60;
const int Value_Nagelknueppel			= 10;
//Wolfsmesser - ItMw_1H_Sword_L_03 //ADDON
/* const int Damage_Wolfsmesser 			= 12; 
const int Condition_Wolfsmesser			= 5;
const int Range_Wolfsmesser				= 30;
const int Value_Wolfsmesser				= 350; */
//AlriksSword
const int Damage_Alrik					= 25; //+10% 
const int Condition_Alrik				= 20;
const int Range_Alrik					= 70;
const int Value_Alrik					= 50; //wegen Sprache 
//Wolfsklinge - ItMw_1H_Sword_L_03
const int Damage_Wolfsklinge 			= 12; 
const int Condition_Wolfsklinge			= 5;
const int Range_Wolfsklinge				= 30;
const int Value_Wolfsklinge				= 10;
//grobes Kurzschwert - NEUE INSTANZ 
const int Damage_ShortSword2 			= 10; //12
const int Condition_ShortSword2			= 10;
const int Range_ShortSword2				= 50;
const int Value_ShortSword2				= 250;
//kleine Sense - NEUE INSTANZ 
const int Damage_Sense					= 12; 
const int Condition_Sense				= 10;
const int Range_Sense					= 60;
const int Value_Sense					= 250;
//Degen 	- ItMw_1h_Vlk_Sword
const int Damage_VLKSchwert 			= 40;
const int Condition_VLKSchwert			= 60; //DEX
const int Range_VLKSchwert				= 70;
const int Value_VLKSchwert				= 1200; 
	const int Damage_BanditVLKSchwert 		= 20;
	const int Condition_BanditVLKSchwert	= 30; //DEX
	const int Value_BanditTrader			= 250;	//Degen der Banditen
//Kampfstab (2h) - ItMw_1h_Nov_Mace 
const int Damage_NovMace				= 20;
const int Condition_NovMace				= 15;
const int Range_NovMace					= 130;
const int Value_NovMace					= 500; 
//Holzfälleraxt (2h) - ItMw_2h_Bau_Axe
const int Damage_Bau2hAxt				= 20; 
const int Condition_Bau2hAxt			= 25;
const int Range_Bau2hAxt				= 70;
const int Value_Bau2hAxt				= 500; 
//Spitzhacke (2h) - ItMw_2H_Axe_L_01
const int Damage_Spitzhacke 			= 20;
const int Condition_Spitzhacke			= 10;
const int Range_Spitzhacke				= 60;
const int Value_Spitzhacke				= 300;
//rostiges Schwert - STANDARDOBJEKTIERUNG - ItMw_1h_MISC_Sword
const int Damage_MiscSword				= 15;
const int Condition_MiscSword			= 10;
const int Range_MiscSword				= 70;
const int Value_MiscSword				= 10; 
//rostige Axt (2h) - STANDARDOBJEKTIERUNG - ItMw_1h_MISC_Axe
const int Damage_MiscAxe				= 25; 
const int Condition_MiscAxe				= 25;
const int Range_MiscAxe					= 80;
const int Value_MiscAxe					= 20; 
//rostiger Zweihänder - STANDARDOBJEKTIERUNG - ItMw_2H_Sword_M_01
const int Damage_Misc2hSword			= 25; 
const int Condition_Misc2hSword			= 25;
const int Range_Misc2hSword				= 110; //100
const int Value_Misc2hSword				= 30; 
//grobes Breitschwert - NUR MILIZ - ItMw_1h_Mil_Sword
const int Damage_MilSchwert				= 25; 
const int Condition_MilSchwert			= 20;
const int Range_MilSchwert				= 90;
const int Value_MilSchwert				= 50; 
//grobes Broadsword
const int Damage_Broadsword				= 50;
const int Condition_Broadsword			= 45;
const int Range_Broadsword				= 90;
const int Value_Broadsword				= 550;
//grobes Fine Broadsword
const int Damage_FineBroadsword			= 60;
const int Condition_FineBroadsword		= 50;
const int Range_FineBroadsword			= 90;
const int Value_FineBroadsword			= 1000;
//grobes Kriegsbeil - SÖLDNER - ItMw_1h_Sld_Axe
const int Damage_Sld1hAxt 				= 25; 
const int Condition_Sld1hAxt			= 20;
const int Range_Sld1hAxt				= 70; 
const int Value_Sld1hAxt				= 40; 
//grobes Schwert - SÖLDNER - ItMw_1h_Sld_Sword
const int Damage_Sld1hSchwert			= 25; 
const int Condition_Sld1hSchwert		= 20;
const int Range_Sld1hSchwert			= 70;
const int Value_Sld1hSchwert			= 40;
// ****** folgende Waffen sind eigentlich zu gut für Kapitel 1, NSCs sind aber noch VIEL zu stark ******
//grobe Kriegsaxt (2h) - SÖLDNER - ItMw_2h_Sld_Axe
const int Damage_Sld2hAxe				= 35; 
const int Condition_Sld2hAxe			= 40;
const int Range_Sld2hAxe				= 80;
const int Value_Sld2hAxe				= 60;
//grober Zweihänder (2h) - SÖLDNER - ItMw_2h_Sld_Sword
const int Damage_Sld2hSchwert			= 35;
const int Condition_Sld2hSchwert		= 40;
const int Range_Sld2hSchwert			= 110; //130
const int Value_Sld2hSchwert			= 60; 
//Addon
//PIR2hAxe
const int Damage_PIR2hAxe				= 40; 
const int Condition_PIR2hAxe			= 40;
const int Range_PIR2hAxe				= 80;
const int Value_PIR2hAxe				= 700;

const int Damage_PIR2hSword				= 40; 
const int Condition_PIR2hSword			= 40;
const int Range_PIR2hSword				= 120;
const int Value_PIR2hSword				= 700;
	
const int Damage_PIR1hAxe				= 30; 
const int Condition_PIR1hAxe			= 30;
const int Range_PIR1hAxe				= 60;
const int Value_PIR1hAxe				= 600;

const int Damage_PIR1hSword				= 30; 
const int Condition_PIR1hSword			= 20;
const int Range_PIR1hSword				= 70;
const int Value_PIR1hSword				= 600;
//Paladinschwert - NUR PALADIN - ItMw_1h_Pal_Sword
const int Damage_PalSchwert 			= 30; 
const int Condition_PalSchwert			= 30;
const int Range_PalSchwert				= 90;
const int Value_PalSchwert				= 600;
//Paladin Zweihänder - NUR PALADIN - ItMw_2h_Pal_Sword
const int Damage_PalZweihaender			= 40;
const int Condition_PalZweihaender		= 40;
const int Range_PalZweihaender			= 110;
const int Value_PalZweihaender			= 800;

// **********************
// Mission Item Kapitel 1 
// **********************
//Rhobars Hammer - Holy_Hammer_MIS
const int Damage_HolyHammer				= 35; 
const int Condition_HolyHammer			= 10; 
const int Range_HolyHammer				= 100;
const int Value_HolyHammer				= 1000;

// ************************************
// Ork- und Echsenmenschenwaffen
// -----------------------------
// ACHTUNG: Orkwaffen können auch schon 
// in Kapitel 1 erlangt werden!
// ************************************
// ------ Orc Scout ------
const int Damage_Orkschwert			=  30; 
const int Condition_Orkschwert		=  50;
const int Range_Orkschwert			= 100;
const int Value_Orkschwert			=  5;
// ------ Orkwaffen ------
const int Damage_Orkaxt_01			=  35; 
const int Condition_Orkaxt_01		=  55;
const int Range_Orkaxt_01			= 100;
const int Value_Orkaxt_01			=  10;

const int Damage_Orkaxt_02			=  40; 
const int Condition_Orkaxt_02		=  60;
const int Range_Orkaxt_02			= 110;
const int Value_Orkaxt_02			=  15;

const int Damage_Orkaxt_03			=  45; 
const int Condition_Orkaxt_03		=  65;
const int Range_Orkaxt_03			= 110;
const int Value_Orkaxt_03			=  20;

const int Damage_Orkaxt_04			=  50; 
const int Condition_Orkaxt_04		=  70;
const int Range_Orkaxt_04			= 130;
const int Value_Orkaxt_04			=  25;
// ------ Echsenmenschen ------
const int Damage_Orkmace_01			=  60; 
const int Condition_Orkmace_01		=  80;
const int Range_Orkmace_01			= 110;
const int Value_Orkmace_01			=  30;
// ------ Ork-Elite ------
const int Damage_Orkschwert_01		=  50; 
const int Condition_Orkschwert_01	=  70;
const int Range_Orkschwert_01		= 140;
const int Value_Orkschwert_01		=  50;

// *******************
// Kapitel 1 - Händler
// *******************
//Kurzschwert - NEUE INSTANZ
const int Damage_ShortSword3 		= 12; 
const int Condition_ShortSword3		= 10;
const int Range_ShortSword3			= 50;
const int Value_ShortSword3			= 250;
//Nagelkeule - NEUE INSTANZ
const int Damage_Nagelkeule 		= 18; 
const int Condition_Nagelkeule		= 10;
const int Range_Nagelkeule			= 70;
const int Value_Nagelkeule			= 450;
//Wolfszahn - NEUE INSTANZ
const int Damage_ShortSword4 		= 20; 
const int Condition_ShortSword4		= 10;
const int Range_ShortSword4			= 50;
const int Value_ShortSword4			= 550;
//Kriegskeule - NEUE INSTANZ
const int Damage_Kriegskeule 		= 22; 
const int Condition_Kriegskeule		= 20;
const int Range_Kriegskeule			= 50;
const int Value_Kriegskeule			= 500;
//Richtstab (2h) - NEUE INSTANZ    
const int Damage_Richtstab 			= 25; 
const int Condition_Richtstab		= 20;
const int Range_Richtstab			= 110;
const int Value_Richtstab			= 600;
//edles Kurzschwert - NEUE INSTANZ    
const int Damage_ShortSword5 		= 25; 
const int Condition_ShortSword5		= 15;
const int Range_ShortSword5			= 50;
const int Value_ShortSword5			= 750;
//Kriegshammer - NEUE INSTANZ
const int Damage_Kriegshammer1 		= 28; 
const int Condition_Kriegshammer1	= 30;
const int Range_Kriegshammer1		= 40;
const int Value_Kriegshammer1		= 550;
//Hellebarde (2h) - NEUE INSTANZ
const int Damage_Hellebarde			= 28; 
const int Condition_Hellebarde		= 20;
const int Range_Hellebarde			= 80;
const int Value_Hellebarde			= 550;
//schwere Nagelkeule - NEUE INSTANZ
const int Damage_Nagelkeule2 		= 28; 
const int Condition_Nagelkeule2		= 20;
const int Range_Nagelkeule2			= 60;
const int Value_Nagelkeule2			= 600; 
//Schiffsaxt - NEUE INSTANZ
const int Damage_Schiffsaxt 		= 30; 
const int Condition_Schiffsaxt		= 25;
const int Range_Schiffsaxt			= 70;
const int Value_Schiffsaxt			= 600;
//Piratensäbel - NEUE INSTANZ 
const int Damage_Piratensaebel 		= 30; 
const int Condition_Piratensaebel	= 20; 
const int Range_Piratensaebel		= 70;
const int Value_Piratensaebel		= 700;
//grobes Langschwert - NUR bei Sld-Händler - NEUE INSTANZ                        
const int Damage_Schwert	 		= 30; 
const int Condition_Schwert			= 30; 
const int Range_Schwert				= 90;
const int Value_Schwert				= 650;

// ****************************
// Schmieden Kapitel 1 (Common)
// ****************************
//selbstgeschmiedetes Schwert - ItMw_1H_Common_01
const int Damage_Common1			= 30; //+5%
const int Condition_Common1			= 20;
const int Range_Common1				= 70;
const int Value_Common1				= 450;

// *******************
// Kapitel 2 - Händler
// *******************
//RangerStaff	- NEUE INSTANZ //ADDON
const int Damage_RangerStaff		= 20; 
const int Condition_RangerStaff		= 15;
const int Range_RangerStaff			= 130;
const int Value_RangerStaff			= 900;
//MageStaff - Shared
const int RANGE_MageStaff				= 120;
//MageStaff	- Typhoon
const int Damage_MageStaff_Blades_2H_01		= 40;
const int Condition_MageStaff_Blades_2H_01	= 60;
const int Value_MageStaff_Blades_2H_01		= 800;
//MageStaff	- Tsunami
const int Damage_MageStaff_Blades_2H_02		= 40;
const int Condition_MageStaff_Blades_2H_02	= 80;
const int Value_MageStaff_Blades_2H_02		= 800;
//MageStaff	- Tornado
const int Damage_MageStaff_Blades_2H_03		= 40;
const int Condition_MageStaff_Blades_2H_03	= 70;
const int Value_MageStaff_Blades_2H_03		= 800;
//MageStaff	- Ulthar's staff
const int Damage_MageStaff_Good_2H_01		= 30;
const int Condition_MageStaff_Good_2H_01	= 200;
const int Value_MageStaff_Good_2H_01		= 800;
//MageStaff	- Staff of Ice
const int Damage_MageStaff_Good_2H_02		= 30;
const int Condition_MageStaff_Good_2H_02	= 90;
const int Value_MageStaff_Good_2H_02		= 800;
//MageStaff	- Staff of Fire
const int Damage_MageStaff_Good_2H_03		= 30;
const int Condition_MageStaff_Good_2H_03	= 100;
const int Value_MageStaff_Good_2H_03		= 800;
//MageStaff	- Staff of Thunder
const int Damage_MageStaff_Normal_2H_01		= 20;
const int Condition_MageStaff_Normal_2H_01	= 40;
const int Value_MageStaff_Normal_2H_01		= 800;
//MageStaff	- Magic staff
const int Damage_MageStaff_Normal_2H_02		= 20;
const int Condition_MageStaff_Normal_2H_02	= 30;
const int Value_MageStaff_Normal_2H_02		= 800;
//MageStaff	- Summoning staff
const int Damage_MageStaff_Normal_2H_03		= 20;
const int Condition_MageStaff_Normal_2H_03	= 50;
const int Value_MageStaff_Normal_2H_03		= 800;
/*
const int Damage_Stab01				= 25; 
const int Condition_Stab01			= 25;
const int Range_Stab01				= 120;
const int Value_Stab01				= 900;
//tatsächlicher Zauber Stab	- NEUE INSTANZ //ADDON
const int Damage_Stab02				= 20; 
const int Condition_Stab02			= 20;
const int Range_Stab02				= 120;
const int Value_Stab02				= 850;
//const int Bonus_Stab02				= 0;
//Wassermagier	- NEUE INSTANZ //ADDON
const int Damage_Stab03				= 35; 
const int Condition_Stab03			= 30;
const int Range_Stab03				= 120;
const int Value_Stab03				= 950;
const int Bonus_Stab03				= 25;
//Wassermagier	- NEUE INSTANZ //ADDON
const int Damage_Stab04				= 30; 
const int Condition_Stab04			= 40;
const int Range_Stab04				= 120;
const int Value_Stab04				= 1000;
//Wassermagier	- NEUE INSTANZ //ADDON
const int Damage_Stab05				= 40; 
const int Condition_Stab05			= 35;
const int Range_Stab05				= 120;
const int Value_Stab05				= 1050;
//const int Bonus_Stab05				= 0;
*/
//Stabkeule - NEUE INSTANZ
const int Damage_Stabkeule 			= 32; 
const int Condition_Stabkeule		= 20;
const int Range_Stabkeule			= 130;
const int Value_Stabkeule			= 700;
//leichter Zweihänder	- NEUE INSTANZ
const int Damage_Zweihaender1		= 32;
const int Condition_Zweihaender1	= 30;
const int Range_Zweihaender1		= 130; //110
const int Value_Zweihaender1		= 750;
//Steinbrecher - NEUE INSTANZ
const int Damage_Steinbrecher 		= 35; 
const int Condition_Steinbrecher	= 25;
const int Range_Steinbrecher		= 50; 
const int Value_Steinbrecher		= 800;
//Schädelspicker	- NEUE INSTANZ
const int Damage_Spicker			= 35; 
const int Condition_Spicker			= 30;
const int Range_Spicker				= 60; 
const int Value_Spicker				= 700;
//leichte Streitaxt	- NEUE INSTANZ				
const int Damage_Streitaxt1			= 35; 
const int Condition_Streitaxt1		= 30;
const int Range_Streitaxt1			= 70;
const int Value_Streitaxt1			= 800;
//edles Schwert - NEUE INSTANZ
const int Damage_Schwert1			= 35; //+5%
const int Condition_Schwert1		= 30;
const int Range_Schwert1			= 70;
const int Value_Schwert1			= 750;
//Langschwert - NEUE Instanz
const int Damage_Schwert2			= 37; 
const int Condition_Schwert2		= 27;
const int Range_Schwert2			= 90;
const int Value_Schwert2			= 850;
//Doppelaxt - NEUE INSTANZ
const int Damage_Doppelaxt 			= 40; 
const int Condition_Doppelaxt		= 35;
const int Range_Doppelaxt			= 70;
const int Value_Doppelaxt			= 900;
//Bartaxt	- NEUE INSTANZ
const int Damage_Bartaxt			= 40; 
const int Condition_Bartaxt			= 40;
const int Range_Bartaxt				= 70;
const int Value_Bartaxt				= 900;
//Khardimons Hammer - NEUE INSTANZ
//const int Damage_Khardimon 			= 90; 
//const int Condition_Khardimon		= 90;
//const int Range_Khardimon			= 65;
//const int Value_Khardimon		  	= 900;
//Morgenstern - NEUE INSTANZ
const int Damage_Morgenstern 		= 45; 
const int Condition_Morgenstern		= 45;
const int Range_Morgenstern			= 60;
const int Value_Morgenstern			= 900;
//grobes Bastardschwert - NEUE INSTANZ 
const int Damage_Schwert3			= 45; 
const int Condition_Schwert3		= 45;
const int Range_Schwert3			= 100;
const int Value_Schwert3			= 850;
//edles Langschwert - NEUE INSTANZ
const int Damage_Schwert4			= 45; //+6%
const int Condition_Schwert4		= 35;
const int Range_Schwert4			= 90;
const int Value_Schwert4			= 900;

// *******************
// Schmieden Kapitel 2
// *******************
// Selbstgeschmiedetes Langschwert - ItMw_1H_Special_01
const int Damage_Special_1H_1		= 45; //+10%
const int Condition_Special_1H_1	= 40; 
const int Range_Special_1H_1		= 90;
const int Value_Special_1H_1		= 750;
// selbstgeschmiedeter Zweihänder - ItMw_2H_Special_01
const int Damage_Special_2H_1		= 50; //+10%
const int Condition_Special_2H_1	= 50;  
const int Range_Special_2H_1		= 110; //100
const int Value_Special_2H_1		= 900;

// *******************
// Kapitel 3 - Händler
// *******************
//Rapier - NEUE INSTANZ
const int Damage_Rapier 			= 50; //+8%
const int Condition_Rapier			= 50; //DEX
const int Range_Rapier				= 70;
const int Value_Rapier				= 2000;
//Rubinklinge - NEUE INSTANZ
const int Damage_Rubinklinge 		= 50; //+7%
const int Condition_Rubinklinge		= 50; 
const int Range_Rubinklinge			= 70; 
const int Value_Rubinklinge			= 1200;
//Machete - NEUE INSTANZ	//ADDON
const int Damage_Machete 			= 40; 
const int Condition_Machete			= 30; 
const int Range_Machete				= 75; 
const int Value_Machete				= 1100;
//Alte Machete - NEUE INSTANZ	//ADDON
const int Damage_AltMachete 		= 30; 
const int Condition_AltMachete		= 20; 
const int Range_AltMachete			= 70; 
const int Value_AltMachete			= 600;
//Streitkolben - NEUE INSTANZ
const int Damage_Streitkolben 		= 50; 
const int Condition_Streitkolben	= 45; 
const int Range_Streitkolben		= 60; 
const int Value_Streitkolben		= 1000;
//Zweihänder - NEUE INSTANZ
const int Damage_Zweihaender2 		= 55; 
const int Condition_Zweihaender2	= 60; 
const int Range_Zweihaender2		= 110; //110
const int Value_Zweihaender2		= 1050;
//Machete 2h - NEUE INSTANZ	//ADDON
const int Damage_Hacker 			= 55; 
const int Condition_Hacker			= 50; 
const int Range_Hacker				= 105; 
const int Value_Hacker				= 1100;
//Alte Machete 2h - NEUE INSTANZ	//ADDON
const int Damage_AltHacker 			= 40; 
const int Condition_AltHacker		= 40; 
const int Range_AltHacker			= 95; 
const int Value_AltHacker			= 700;
//Runenschwert - NEUE INSTANZ
const int Damage_Runenschwert 		= 55; 
const int Condition_Runenschwert	= 50; 
const int Range_Runenschwert		= 90; 
const int Value_Runenschwert		= 1100;
//Rabenschnabel - NEUE INSTANZ
const int Damage_Rabenschnabel 		= 58; 
const int Condition_Rabenschnabel	= 50; 
const int Range_Rabenschnabel		= 60; 
const int Value_Rabenschnabel		= 1100;
//edles Bastardschwert - NEUE INSTANZ
const int Damage_Schwert5			= 58; 
const int Condition_Schwert5		= 60; 
const int Range_Schwert5			= 100;
const int Value_Schwert5			= 1100;
//Inquisitor 
const int Damage_Inquisitor 		= 60; 
const int Condition_Inquisitor		= 50; 
const int Range_Inquisitor			= 60; 
const int Value_Inquisitor			= 1100;
//Streitaxt (2h) - NEUE INSTANZ
const int Damage_Streitaxt2 		= 60; 
const int Condition_Streitaxt2		= 60; 
const int Range_Streitaxt2			= 100;
const int Value_Streitaxt2			= 1100;
//Runen-Macht (2h) - NEUE INSTANZ
const int Damage_Zweihaender3 		= 60; 
const int Condition_Zweihaender3	= 60; 
const int Range_Zweihaender3		= 120;
const int Value_Zweihaender3		= 1150;
//Sturmknecht (2h) - NEUE INSTANZ //ADDON
const int Damage_Sturmknecht 		= 115;
const int Condition_Sturmknecht		= 115; 
const int Range_Sturmknecht			= 130;
const int Value_Sturmknecht			= 1150;
//Steinkeule2 (2h) - NEUE INSTANZ //ADDON
//const int Damage_Steinkeule2 		= 120; 
//const int Condition_Steinkeule2		= 120; 
//const int Range_Steinkeule2			= 130;
//const int Value_Steinkeule2			= 600;

// *******************
// Schmieden Kapitel 3
// *******************
// selbstgeschmiedetes Bastardschwert - ItMw_1H_Special_02
const int Damage_Special_1H_2		= 60; //+10%
const int Condition_Special_1H_2	= 50;
const int Range_Special_1H_2		= 100;
const int Value_Special_1H_2		= 1200; 
//selbstgeschmiedeter Zweihänder II - ItMw_2H_Special_02
const int Damage_Special_2H_2		= 70; //+10%
const int Condition_Special_2H_2	= 70;
const int Range_Special_2H_2		= 120; //110
const int Value_Special_2H_2		= 1500;

// *******************
// Kapitel 4 - Händler
// *******************
//schwerer Kriegshammer - NEUE INSTANZ
//const int Damage_Quarhodron			= 120; 
//const int Condition_Quarhodron		= 120;
//const int Range_Quarhodron			= 60;
//const int Value_Quarhodron			= 1200;
//El Bastardo - NEUE INSTANZ
const int Damage_ElBastardo			= 65; //+8%
	const int Damage_Betty		= 70;
const int Condition_ElBastardo		= 65;
const int Range_ElBastardo			= 100;
const int Value_ElBastardo			= 1300;
	const int Value_Betty		= 1300;
//schwerer Kriegshammer - NEUE INSTANZ
const int Damage_Kriegshammer2		= 65; 
const int Condition_Kriegshammer2	= 70;
const int Range_Kriegshammer2		= 60;
const int Value_Kriegshammer2		= 1200;
//Meisterdegen - NEUE INSTANZ
const int Damage_Meisterdegen		= 65;
const int Condition_Meisterdegen	= 100; //DEX
const int Range_Meisterdegen		= 100;
const int Value_Meisterdegen		= 2400;
//Folteraxt (2h) - NEUE INSTANZ
const int Damage_Folteraxt			= 65; 
const int Condition_Folteraxt		= 65;
const int Range_Folteraxt			= 80;
const int Value_Folteraxt			= 1250;
//Orkschlächter - NEUE INSTANZ
const int Damage_Orkschlaechter	 	= 65; 
const int Condition_Orkschlaechter	= 65;
const int Range_Orkschlaechter		= 100;
const int Value_Orkschlaechter		= 1300;
//Schwerer Zweihänder
const int Damage_Zweihaender4 		= 68; 
const int Condition_Zweihaender4	= 68; 
const int Range_Zweihaender4		= 110; //120
const int Value_Zweihaender4		= 1350;
//Schlachtaxt (2h) - NEUE INSTANZ
const int Damage_Schlachtaxt 		= 70; 
const int Condition_Schlachtaxt		= 70; 
const int Range_Schlachtaxt			= 100;
const int Value_Schlachtaxt			= 1400;
//Krummschwert (2h) - NEUE INSTANZ
const int Damage_Scimitar 			= 70;
const int Condition_Scimitar		= 70;
const int Range_Scimitar			= 120;
const int Value_Scimitar			= 1450;
//Barbarenstreitaxt (2h) - NEUE INSTANZ
const int Damage_Barbarenstreitaxt	= 75; 
const int Condition_Barbarenstreitaxt	= 75;
const int Range_Barbarenstreitaxt	= 90;
const int Value_Barbarenstreitaxt	= 1500;
//Sturmbringer (2h) - NEUE INSTANZ
const int Damage_Sturmbringer		= 75; 
const int Condition_Sturmbringer	= 65;
const int Range_Sturmbringer		= 130;
const int Value_Sturmbringer		= 1500;

// *******************
// Schmieden Kapitel 4
// *******************
// selbstgeschmiedetes Schwert III - ItMw_1H_Special_03
const int Damage_Special_1H_3		= 75; //+10%
const int Condition_Special_1H_3	= 65; 
const int Range_Special_1H_3		= 100;
const int Value_Special_1H_3		= 1500;
// selbstgeschmiedeter Zweihänder III - ItMw_2H_Special_03
const int Damage_Special_2H_3		= 90; //+10%
const int Condition_Special_2H_3	= 90;
const int Range_Special_2H_3		= 130;
const int Value_Special_2H_3		= 1800;

// *******************
// Kapitel 5 - Händler
// *******************
//Berserkeraxt - NEUE INSTANZ
const int Damage_Berserkeraxt 		= 80; 
const int Condition_Berserkeraxt	= 80;
const int Range_Berserkeraxt		= 90; 
const int Value_Berserkeraxt		= 3000;
//Drachenschneide - NEUE INSTANZ
const int Damage_Drachenschneide 	= 80; 
const int Condition_Drachenschneide	= 80;
const int Range_Drachenschneide		= 120;
const int Value_Drachenschneide		= 2900;

// *******************
// Schmieden Kapitel 5
// *******************
// selbstgeschmiedetes Schwert IV - ItMw_1H_Special_04
const int Damage_Special_1H_4		= 90; //+10%
const int Condition_Special_1H_4	= 80; 
const int Range_Special_1H_4		= 100; 
const int Value_Special_1H_4		= 1800;
//selbstgeschmiedeter Zweihänder IV - ItMw_2H_Special_04
const int Damage_Special_2H_4		= 110; //+10%
const int Condition_Special_2H_4	= 100;
const int Range_Special_2H_4		= 140;
const int Value_Special_2H_4		= 2100;

// ************************
// Gesegnete Paladin-Waffen
// ************************
//Rohe Erzklinge - ItMw_1H_Blessed_01 
const int Damage_Blessed_1H_1		= 60; 
const int Condition_Blessed_1H_1	= 40; 
const int Range_Blessed_1H_1		= 100;
const int Value_Blessed_1H_1		= 2000; 
//Gesegnete Erzklinge - ItMw_1H_Blessed_02 
const int Damage_Blessed_1H_2		= 70; 
const int Condition_Blessed_1H_2	= 40;
const int Range_Blessed_1H_2		= 100;
const int Value_Blessed_1H_2		= 3000;
//Innos Zorn - ItMw_1H_Blessed_03 
const int Damage_Blessed_1H_3		= 80; 
const int Condition_Blessed_1H_3	= 40;
const int Range_Blessed_1H_3		= 100;
const int Value_Blessed_1H_3		= 4000;
// -----------------------------------------------------------------------------------------
//Rohe Erzklinge (2h) - ItMw_2H_Blessed_01
const int Damage_Blessed_2H_1		= 70; 
const int Condition_Blessed_2H_1	= 50;
const int Range_Blessed_2H_1		= 130;
const int Value_Blessed_2H_1		= 2000;
//Ordensschwert (2h) - ItMw_2H_Blessed_02
const int Damage_Blessed_2H_2		= 85; 
const int Condition_Blessed_2H_2	= 50;
const int Range_Blessed_2H_2		= 130;
const int Value_Blessed_2H_2		= 3000;
//Der heilige Vollstrecker (2h) - ItMw_2H_Blessed_03
const int Damage_Blessed_2H_3		= 100; 
const int Condition_Blessed_2H_3	= 50;
const int Range_Blessed_2H_3		= 130;
const int Value_Blessed_2H_3		= 4000;

