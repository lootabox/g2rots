// *********************************************************************
// game options menu
// *********************************************************************

INSTANCE MENU_OPT_GRAPHICS(C_MENU_DEF)
{
	backpic			= MENU_BACK_PIC;

	items[0]		= "MENUITEM_GRA_HEADLINE";

	items[1]		= "MENUITEM_GRA_SIGHT";
	items[2]		= "MENUITEM_GRA_SIGHT_CHOICE";

	items[3]		= "MENUITEM_VOB_SIGHT";
	items[4]		= "MENUITEM_VOB_SIGHT_CHOICE";

	items[5]		= "MENUITEM_GRA_TEXQUAL";
	items[6]		= "MENUITEM_GRA_TEXQUAL_SLIDER";

	items[7]		= "MENUITEM_GRA_MODEL_DETAIL";
	items[8]		= "MENUITEM_GRA_MODEL_DETAIL_SLIDER";
	
	items[9]		= "MENUITEM_GAME_BLOOD";
	items[10]		= "MENUITEM_GAME_BLOOD_CHOICE";

	items[11]		= "MENUITEM_GAME_FIGHTFOCUS";
	items[12]		= "MENUITEM_GAME_FIGHTFOCUS_CHOICE";

	items[13]		= "MENUITEM_GAME_INTERACTFOCUS";
	items[14]		= "MENUITEM_GAME_INTERACTFOCUS_CHOICE";
	
	items[15]		= "MENUITEM_GAME_ANIMATE_WINDOWS";
	items[16]		= "MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE";

	items[17]		= "MENUITEM_GAME_INV";
	items[18]		= "MENUITEM_GAME_INV_CHOICE";

	items[19]		= "MENUITEM_GRA_BACK";

	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_GRA_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"VISUAL SETTINGS";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};

//
// Sight
//

instance MENUITEM_GRA_SIGHT(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "View distance";
	text[1]		= "Select general view distance."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;	
};


INSTANCE MENUITEM_GRA_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		=   "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*0 + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;dimy = MENU_CHOICE_DY;
	// Aktionen	
	onChgSetOption													= "sightValue";
	onChgSetOptionSection 											= "PERFORMANCE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_VOB_SIGHT(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Object fading";
	text[1]		= "Select object fading distance."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;	
};


INSTANCE MENUITEM_VOB_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		=   "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;dimy = MENU_CHOICE_DY;
	// Aktionen	
	onChgSetOption													= "zVobFarClipZScale";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags | IT_PERF_OPTION | IT_TXT_CENTER;
};


//
// Texture-Quality
//

INSTANCE MENUITEM_GRA_TEXQUAL(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Texture detail";
	text[1]		= 	"Select detail level of textures, requires restart."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*2;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

INSTANCE MENUITEM_GRA_TEXQUAL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*2 + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;dimy = MENU_SLIDER_DY;
	// Aktionen	
	onChgSetOption													= "texDetailIndex";
	onChgSetOptionSection 											= "INTERNAL";
	// Weitere Eigenschaften			
	userFloat[0]	= 5; // 5+1 Slider-Steps: 32, 64, 128,256,512, oo
	userString[0]	= MENU_SLIDER_POS_PIC;
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

//
// Modell-Detail-Level
//

INSTANCE MENUITEM_GRA_MODEL_DETAIL(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Model detail";
	text[1]		= 	"Select detail level of models."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_MODEL_DETAIL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*3 + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;dimy = MENU_SLIDER_DY;
	// Aktionen
	onChgSetOption													= "modelDetail";
	onChgSetOptionSection 											= "PERFORMANCE";
	// Weitere Eigenschaften
	userFloat[0]	= 10; // 10 Slider-Steps
	userString[0]	=	MENU_SLIDER_POS_PIC;	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags | IT_PERF_OPTION;
};

INSTANCE MENUITEM_GAME_BLOOD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Blood detail";
	text[1]		= 	"Select how much blood is shown."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT | IT_EXTENDED_MENU;
};

instance MENUITEM_GAME_BLOOD_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"off|less|more|bloodbath";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*4 + MENU_CHOICE_YPLUS;
	dimx 		= MENU_CHOICE_DX;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "bloodDetail";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_EXTENDED_MENU;
};


INSTANCE MENUITEM_GAME_FIGHTFOCUS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Combat focus";
	text[1]		= 	"Select highlighting of the current target."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*6;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"none|box|lighten|both";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*6 + MENU_CHOICE_YPLUS;
	dimx 		= MENU_CHOICE_DX;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "highlightMeleeFocus";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


INSTANCE MENUITEM_GAME_INTERACTFOCUS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Object focus";
	text[1]		= 	"Toggle object highlighting on/off."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*7;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INTERACTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"off|on";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*7 + MENU_CHOICE_YPLUS;
	dimx 		= MENU_CHOICE_DX;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "highlightInteractFocus";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};

INSTANCE MENUITEM_GAME_ANIMATE_WINDOWS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Animated windows";
	text[1]		= 	"Toggle dialog window animations on/off."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*8;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"off|on";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*8 + MENU_CHOICE_YPLUS;
	dimx 		= MENU_CHOICE_DX;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "animatedWindows";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};

instance MENUITEM_GAME_INV(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Inventory columns";
	text[1] = "Select inventory column count, requires restart.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 9);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INV_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "automatic|1 column|2 columns|3 columns|4 columns|5 columns|6 columns|7 columns|8 columns|9 columns|10 columns";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 9) + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "invMaxColumns";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

INSTANCE MENUITEM_GRA_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"BACK";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};

