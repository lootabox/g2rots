//************************************************
//   Item copying
// https://forum.worldofplayers.de/forum/threads/1203625-Creating-instances-dinamically/page2?p=20511013&viewfull=1#post20511013
//************************************************

func void B_CopyItem(var C_ITEM newObject, var int originalInstance)
{
    Wld_InsertItem(originalInstance, "TOT");
    item = MEM_CpyInst(originalInstance);

    //newObject.id = item.id;
    newObject.name = item.name;
    newObject.nameID = item.nameID;
    newObject.hp = item.hp;
    newObject.hp_max = item.hp_max;
    newObject.mainflag = item.mainflag;
    newObject.flags = item.flags;
    newObject.weight = item.weight;
    newObject.value = item.value;
    newObject.damageType = item.damageType;
    newObject.damageTotal = item.damageTotal;
    newObject.wear = item.wear;
    newObject.protection[0] = item.protection[0];
    newObject.protection[1] = item.protection[1];
    newObject.protection[2] = item.protection[2];
    newObject.protection[3] = item.protection[3];
    newObject.protection[4] = item.protection[4];
    newObject.protection[5] = item.protection[5];
    newObject.protection[6] = item.protection[6];
    newObject.protection[7] = item.protection[7];
    newObject.nutrition = item.nutrition;
    newObject.change_atr[0] = item.change_atr[0];
    newObject.change_atr[1] = item.change_atr[1];
    newObject.change_atr[2] = item.change_atr[2];
    newObject.change_value[0] = item.change_value[0];
    newObject.change_value[1] = item.change_value[1];
    newObject.change_value[2] = item.change_value[2];
    newObject.cond_atr[0] = item.cond_atr[0];
    newObject.cond_atr[1] = item.cond_atr[1];
    newObject.cond_atr[2] = item.cond_atr[2];
    newObject.cond_value[0] = item.cond_value[0];
    newObject.cond_value[1] = item.cond_value[1];
    newObject.cond_value[2] = item.cond_value[2];
    newObject.magic = item.magic;
    newObject.owner = item.owner;
    newObject.ownerGuild = item.ownerGuild;
    newObject.disguiseGuild = item.disguiseGuild;
    newObject.visual = item.visual;
    newObject.visual_change = item.visual_change;
    newObject.effect = item.effect;
    newObject.visual_skin = item.visual_skin;
    newObject.scemeName = item.scemeName;
    newObject.material = item.material;
    newObject.munition = item.munition;
    newObject.spell = item.spell;
    newObject.range = item.range;
    newObject.mag_circle = item.mag_circle;
    newObject.description = item.description;
    newObject.inv_zbias = item.inv_zbias;
    newObject.inv_rotx = item.inv_rotx;
    newObject.inv_roty = item.inv_roty;
    newObject.inv_rotz = item.inv_rotz;
    newObject.inv_animate = item.inv_animate;

    var int src; src = _@s(item.text);
    var int dst; dst = _@s(newObject.text);
    MEM_WriteStringArray(dst, 0, MEM_ReadStringArray(src, 0));
    MEM_WriteStringArray(dst, 1, MEM_ReadStringArray(src, 1));
    MEM_WriteStringArray(dst, 2, MEM_ReadStringArray(src, 2));
    MEM_WriteStringArray(dst, 3, MEM_ReadStringArray(src, 3));
    MEM_WriteStringArray(dst, 4, MEM_ReadStringArray(src, 4));
    MEM_WriteStringArray(dst, 5, MEM_ReadStringArray(src, 5));

    newObject.count[0] = item.count[0]; //0;
    newObject.count[1] = item.count[1]; //newObject.damageTotal;
    newObject.count[2] = item.count[2]; //newObject.cond_value[2];
    newObject.count[3] = item.count[3]; //newObject.range*100/253;
    newObject.count[4] = item.count[4]; //item.count[4];
    newObject.count[5] = item.count[5]; //newObject.value;

    var oCItem oc_original; oc_original = MEM_CpyInst(originalInstance);
    var oCItem oc_new;      oc_new = MEM_CpyInst(newObject);
    oc_new.on_equip = oc_original.on_equip;
    oc_new.on_unequip = oc_original.on_unequip;

    Wld_RemoveItem(item);
};

//************************************************
//   Equip/unequip weapon
// https://themodders.org/index.php?topic=21691.0
//************************************************

func void Equip_Item (var C_NPC slf, var int item)
{
    if (! Npc_HasItems (slf, item))
    {
        CreateInvItems (slf, item, 1);
    };

    CALL_PtrParam (MEM_InstToPtr (item));
    CALL__thiscall (MEM_InstToPtr (slf), 7545792);
};

func void Unequip_Item (var C_NPC slf, var int item)
{
    CALL_PtrParam (MEM_InstToPtr (item));
    CALL__thiscall (MEM_InstToPtr (slf), 7546560);
};

//************************************************
//   Scroll mana cost
//************************************************
func int C_GetScrollCost(var int cost)
{
    return (cost + 1) / 2;
};

//************************************************
//   Dex weapons
//************************************************
func void Equip_Dex_Weapon_(var int master)
{
    if (Npc_GetTalentSkill (self, NPC_TALENT_1H) == 1)
    {
        Mdl_ApplyOverlayMds (self, "HUMANS_RAPIER_ST1.MDS");
    }
    else if (Npc_GetTalentSkill (self, NPC_TALENT_1H) == 2)
    {
        if (self.HitChance[NPC_TALENT_1H] >= 90)
        && (master)
        {
            Mdl_ApplyOverlayMds (self, "HUMANS_RAPIER_ST3.MDS");
        }
        else
        {
            Mdl_ApplyOverlayMds (self, "HUMANS_RAPIER_ST2.MDS");
        };
    };
};
func void Equip_Dex_Weapon() { Equip_Dex_Weapon_(FALSE); };
func void Equip_Dex_Weapon_Master() { Equip_Dex_Weapon_(TRUE); };

func void UnEquip_Dex_Weapon()
{
    Mdl_RemoveOverlayMDS (self, "HUMANS_RAPIER_ST1.MDS");
    Mdl_RemoveOverlayMDS (self, "HUMANS_RAPIER_ST2.MDS");
    Mdl_RemoveOverlayMDS (self, "HUMANS_RAPIER_ST3.MDS");
};
