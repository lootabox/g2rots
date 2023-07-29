/* AF_ItemPreview*
* Authors: Fawkes & Auronen
* Version: 0.01 first draft
*
* Description:
*     This feature allows you to preview items during dialogues, when 
*    choosing a reward (Torrez in G1, Fisk (digger's trousers G1))
* 
* How to use:
*     For "full" dialogues you have to declare a variable "var int AFIP_ShowItem"
*     and assign a item instance to it 
*         Example: var int AFIP_ShowItem; AFIP_ShowItem = ItMw_1h_Vlk_Dagger;
*
*     And that's it! 
* 
*     For Info_AddChoice types of dialogues it is a bit more elaborate
*         In the same function you are declaring your Info choices you have to use
*        AFIP_SetChoiceItem function, it takes two parameters:
*            1. function that runs when you choose that option
*            2. item instance
*        In the function that runs when you select the option you declare a variable "var int AFIP_ShowItem"
*
*     And that's it! 
*
*            
*
*
*
*/
 
/* NOTES:
* 
* 
* 
*/

/* TODO:
* 
*    
*     implement "rotate for inventory" function with user rotation?
*  
*     hook this to "oCItemContainer::DrawItemInfo" to have more rows for AF_EnhancedDamage.d?
*        - this would need a more detailed API to set individual rows and other stuff
* 
*/
 


//========================================
// Some wrapper functions for easier 
// item positioning for LeGo Render.d
//========================================
func int Render_AddItemCenter(var int itemInst, var int x, var int y, var int w, var int h) 
{
    return +Render_AddItemPrio(itemInst, x-(w>>1), y-(h>>1), x+((w+1)>>1), y+((h+1)>>1), 0);
};

func int Render_AddItemCenterPrio(var int itemInst, var int x, var int y, var int w, var int h, var int priority) 
{
    return +Render_AddItemPrio(itemInst, x-(w>>1), y-(h>>1), x+((w+1)>>1), y+((h+1)>>1), priority);
};

func int Render_IsOpen(var int rndrHndl) 
{
    var RenderItem itm; itm = get(rndrHndl);
    if (itm.view_open) {
        return TRUE;
    } else {
        return FALSE;
    };
};

//========================================
// Constants
//========================================

/* NOTE: I got these values from the game 
* set to 1280x720 at 1.000 scale in SP
* This needs to be dynamic, but I do not 
* know, how to get to the real formula
*/
const int AFIP_view         = 0;
const int AFIP_rndObj         = 0;

// dimensions
const int AFIP_height         = 1845;
const int AFIP_width         = 4608;

// position
const int AFIP_x             = 1792;
const int AFIP_y             = 6006;

const int AFIP_currentItem    = 0;

const string AFIP_texture    = "Inv_Back_Steal.tga";
const string AFIP_font        = "FONT_OLD_10_WHITE.TGA";
const string AFIP_varName    = "AFIP_SHOWITEM";


//========================================
// returns int value as string, returns 
// empty string, when 0
//========================================
func string countValue (var int val)
{
    if (val) { return IntToString(val); }
    else { return ""; };
};

//========================================
// Deletes both of the views
//========================================
func void AFIP_Delete()
{
    if (AFIP_rndObj) { Render_Remove(AFIP_rndObj); };
    if (AFIP_view) { View_Delete(AFIP_view); };
    AFIP_rndObj = 0;
    AFIP_view = 0;
};

//========================================
// Creates and shows the item preview
//========================================

/* NOTES: 
    - item is passed into the function as a parser ID 
    (just the name of the item instance)
    - it fits one more row (not used here)
    - it is set up (hardcoded) to mimic the in game item preview (roughly)
*/

func void AFIP_Create(var int itemIn)
{
    AFIP_currentItem = itemIn;
    var int itemPtr; itemPtr = Itm_GetPtr(itemIn);
    var oCItem itm; itm = _^(itemPtr);
    Print_GetScreenSize();
    
    if (!AFIP_view) // not really needed, but just to be sure
    {
        AFIP_view = View_Create(1, 1, 1000, 1000);
    };
    
    View_SetTexture(AFIP_view, AFIP_texture);
    
    var string heading; heading = itm.description;
    
    var int width; width     = Print_ToVirtual(Print_GetStringWidth(heading, AFIP_font), PS_X) * PS_VMAX / AFIP_width;
    var int height; height  = 900; // this should be calculated based on the height of the view?
    
    var int head; head = PS_VMax/30;
    var int marg; marg = PS_VMax/64;
    var int marg1; marg1 = PS_VMax/32;
    
    View_AddText(AFIP_view, PS_VMax/2 - width / 2, head, heading, AFIP_font);
    var string txt;
    
    // Lines - left side (text)
    
    repeat(i, 6); var int i;
        txt = MEM_ReadStringArray(_@s(itm.text), i);
        View_AddText(AFIP_view, PS_VMax/15 - head, head + marg + (i+2)*height, txt, AFIP_font);    
    end;

    // Lines - right side (values)
    
    repeat(j, 6); var int j;
        txt = countValue(MEM_ReadIntArray(_@(itm.count), j));
        View_AddText(AFIP_view, PS_VMax - marg1 - 2*Print_ToVirtual(Print_GetStringWidth(txt, AFIP_font), PS_X), head + marg + (j+2)*height,txt , AFIP_font);    
    end;
    
    // Resizing and moving 
    View_Resize(AFIP_view, AFIP_width, AFIP_height);
    View_Move  (AFIP_view, AFIP_x, PS_VMax/2);
    
    if (!AFIP_rndObj) // not really needed, but just to be sure
    {
        AFIP_rndObj = Render_AddItemCenterPrio(itemIn , PS_VMax/2 + 1500, PS_VMax/2 + AFIP_height/2, AFIP_height - 400, Print_ToRatio(AFIP_height - 400, PS_Y), 1);
    };
    
    Render_AddView(AFIP_view);
};

// Taken from Ikarus_doc.d
func void SetVarTo (var string variableName, var int value) {
    var int symPtr;
    symPtr = MEM_GetParserSymbol (variableName);
    
    if (symPtr) { //!= 0 
        var zCPar_Symbol sym;
        sym = MEM_PtrToInst (symPtr);
        
        if ((sym.bitfield & zCPar_Symbol_bitfield_type)
                                    == zPAR_TYPE_INT) {
            sym.content = value;
        } else {
            MEM_Error ("SetVarTo: Die Variable ist kein Integer!");
        };
    } else {
        MEM_Error ("SetVarTo: Das Symbol existiert nicht!");
    };
};

//========================================
// Sets the item, for Info_AddChoice type 
// dialogues
//========================================
func void AFIP_SetChoiceItem(var func action, var int item )
{
    var int fncID; fncID = MEM_GetFuncID(action);
    
    var zCPar_Symbol symfunc; symfunc = _^(MEM_ReadIntArray (contentSymbolTableAddress, fncID));
    
    var string infoFuncName; infoFuncName = symfunc.name;
    
    // building the symbol name
    var string symbName; symbName = ConcatStrings(infoFuncName, ".");
    symbName = ConcatStrings(symbName, AFIP_varName);
    
    SetVarTo(symbName, item);
};

//========================================
// Unused because it doesn't work, but it 
// would be cleaner (I think :) )
//========================================
func void AFIP_Info_AddChoice(var int menu, var string text, var func action, var int item )
{
    // this doesn't work for this particular technique - func action has a different symbol -> AFIP_Info_AddChoice.action
    MEM_Info("== AFIP_Info_AddChoice ==");
    /*
    var int fncID; fncID = MEM_GetFuncID(action);
    var zCPar_Symbol asd; asd = _^(MEM_ReadIntArray (contentSymbolTableAddress, fncID));
    PVs("action.name", asd.name);
    
    var zCPar_Symbol menuSymb; menuSymb = _^(MEM_ReadIntArray (contentSymbolTableAddress, menu));
    
    Info_AddChoice(menu, text, action);

    // zCViewDialogChoice__AddChoice( text, fncID);
    
    var zCPar_Symbol symfunc; symfunc = _^(MEM_ReadIntArray (contentSymbolTableAddress, fncID));
    
    var string infoFuncName; infoFuncName = symfunc.name;
    
    var string symbName; symbName = ConcatStrings(infoFuncName, ".");
    symbName = ConcatStrings(symbName, AFIP_varName);
    PVs("symbName", symbName);
    
    SetVarTo(symbName, item);
    */
};

//========================================
// returns item (its symbol table ID), that 
// is set to be shown in selected dialogue's
// condition function or in case of oCInfoChoice
// in its "action" function
//========================================
func int AFIP_HasItem()
{
    // get selected oCInfo
    var int infoPtr; infoPtr = InfoManager_GetSelectedInfo();
    // get selected oCInfoChoice
    var int infoChoicePtr; infoChoicePtr = InfoManager_GetSelectedInfoChoice();
    if (infoPtr && !infoChoicePtr) 
    {
        // MEM_Info("Info");
        var oCInfo diaInfo; diaInfo = _^(infoPtr);
        
        // getting the name of dialogues condition function 
        /*
            Ideally this would in the info function (it would work even for Info_AddChoice dialogues) but in that 
            case the var is only initialized by Ikarus (to be 0), since the function didn't run - no value assigned
            Should I be saving oCInfo* and oCInfoChoice* in a hash table?? Similarly like I do in AF_EnhancedDamage
        */
        var zCPar_Symbol symfunc; symfunc = _^(MEM_ReadIntArray (contentSymbolTableAddress,  /*diaInfo.information */ diaInfo.conditions));
        
        var string infoFuncName; infoFuncName = symfunc.name;
        // building the variables symbol name
        var string symbName; symbName = ConcatStrings(infoFuncName, ".");
        symbName = ConcatStrings(symbName, AFIP_varName);

        // getting and checking if symbol with this name exists (if user defined item to be shown)
        var int symPtr; symPtr = MEM_GetParserSymbol (symbName);
        if (symPtr == 0) 
        {
            return 0;
        } 
        else 
        {
            var zCPar_Symbol sym;
            sym = _^(symPtr);
            return sym.content;
        };
    } 
    else if ((infoPtr && infoChoicePtr) || (!infoPtr  && infoChoicePtr))
    {
        /*    class oCInfoChoice {
                var string Text;    //zSTRING 
                var int Function;    //int     //symbolindex    
            };*/
        var oCInfoChoice diaInfoChoice; diaInfoChoice = _^(infoChoicePtr);
        var zCPar_Symbol symChoiceFunc; symChoiceFunc = _^(MEM_ReadIntArray (contentSymbolTableAddress, diaInfoChoice.Function));
        
        var string infoChoiceFuncName; infoChoiceFuncName = symChoiceFunc.name;
        
        // building the variables symbol name
        var string symbChoiceName; symbChoiceName = ConcatStrings(infoChoiceFuncName, ".");
        symbChoiceName = ConcatStrings(symbChoiceName, AFIP_varName);
        
        // getting and checking if symbol with this name exists (if user defined item to be shown)
        var int symbPtr; symbPtr = MEM_GetParserSymbol (symbChoiceName);
        if (symbPtr == 0) 
        {
            return 0;
        } 
        else 
        {
            var zCPar_Symbol symb;
            symb = _^(symbPtr);
            return symb.content;
        };
    }
    else
    {
        return 0;
    };    
};

//========================================
// HOOK: runs the frame function at the
// beginning of the dialogue
//========================================
func void _hook_oCInformationManager__OnInfoBegin()
{
    FF_ApplyOnce(FF_AF_ItemPreview);
};

//========================================
// HOOK: removes the frame function at the
// end of the dialogue
//========================================
func void _hook_oCInformationManager__OnTermination()
{
    FF_Remove(FF_AF_ItemPreview);
};

//========================================
// FF: checks if there is item to be 
// shown and shows it
//========================================
func void FF_AF_ItemPreview()
{
    // show only when the dialogue selection is active
    if (MEM_InformationMan.IsWaitingForSelection) 
    {
        // get the item, if there is any
        var int itm; itm = AFIP_HasItem();
        if (itm == 0 ) // if there is no item, delete view (if there's one) and end
        {
            AFIP_currentItem = 0;
            AFIP_Delete();
            return;
        };
        if (AFIP_currentItem != itm) // if the item changed delete the old view and create new one
        {
            AFIP_Delete();
            AFIP_currentItem = 0;
            AFIP_Create(itm);
            return;
        }
        else // there is item to show
        {
            if (!AFIP_view) // == 0 // if the view doesn't already exists
            {
                AFIP_Create(itm);
            };
        };
    }
    else // if dialogue selection is inactive delete the view (checks are in the AFIP_Delete function)
    {
        AFIP_currentItem = 0;
        AFIP_Delete();
        return;
    };
};

//========================================
// Init function
//========================================
func void AF_ItemPreview_Init() 
{
    const int once = 0;
    if (!once) {
        // 0072E430  .text     Debug data           ?OnTermination@oCInformationManager@@IAIXXZ
        // 0x006631A0 protected: void __fastcall oCInformationManager::OnTermination(void)
        HookEngine(MEMINT_SwitchG1G2(7529520, 6697376), MEMINT_SwitchG1G2(6, 7), "_hook_oCInformationManager__OnTermination");
        // 0072D2E0  .text     Debug data           ?OnInfoBegin@oCInformationManager@@IAIXXZ
        // 0x00661FF0 protected: void __fastcall oCInformationManager::OnInfoBegin(void)
        HookEngine(MEMINT_SwitchG1G2(7525088, 6692848), 6, "_hook_oCInformationManager__OnInfoBegin");
        
        if (GOTHIC_BASE_VERSION == 2) {
            // in G2 OnInfoBegin is sometimes not called.
            // oCInformationManager::SetNpc @ 00660b74, size 6 <- always called at the beginning of a dialog
            HookEngine(6687604, 6, "_hook_oCInformationManager__OnInfoBegin");
        };
        once = 1;
    };
};


/*
Nice try, but doesn't work :(
Maybe I have a bug somwhere down here?

// 0x00706E40 protected: virtual void __thiscall oCItemContainer::DrawItemInfo(class oCItem *,class zCWorld *)
func int oCItemContainer__DrawItemInfo(var int this, var int itemPtr) {
    const int oCItemContainer__DrawItemInfo = 7368256;
    const int call = 0;
    if(CALL_Begin(call)) {
        CALL_IntParam(MEM_GetIntAddress(_render_wld));
        CALL_IntParam(MEM_GetIntAddress(itemPtr));
        CALL__thiscall(MEM_GetIntAddress(this), oCItemContainer__DrawItemInfo);
        call = CALL_End();
    };
}; 

func void AFIP_Show(var c_npc npcInst, var c_item itm)
{
    var int itemPtr; itemPtr = Itm_GetPtr(itm);
    var oCNpc npc; npc = Hlp_GetNpc(npcInst);
    
    oCItemContainer__DrawItemInfo(npc.inventory2_vtbl, itemPtr);
};

*/