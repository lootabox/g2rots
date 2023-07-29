
//######################################################
// Constants
//######################################################

var int TAL_DOT_VENOM_TOTAL;    // Percentage
var int TAL_DOT_VENOM_SPEED;    // Percentage per second
var int TAL_DOT_BURN_TOTAL;     // Damage
var int TAL_DOT_BURN_TICKS;     // Tick number

const int DOT_TICK_RATE_MS = 200;
const int DOT_BURN_VFX_DURATION_S = 4;
const int DOT_VENOM_RATE_DEFAULT = 4;

//######################################################
// Buff system
//######################################################

func void BuffSystem_Reset()
{
    // Hero might not be ready at INIT_GLOBAL
    if (Hlp_IsValidNpc(hero)) {
        var int bh;
        bh = Buff_Has(hero, light_persister);
        if (bh) {
            var lCBuff b; b = get(bh);
            spawnLightAboveHero(b.name);
        };

        // Remove FF
        if (FF_Active(BuffSystem_Reset)) {
            FF_Remove(BuffSystem_Reset);
        };
    } else if (!FF_Active(BuffSystem_Reset)) {
        // Apply FF
        FF_ApplyExtGT(BuffSystem_Reset, 500, -1);
    };
};
func void BuffSystem_Init() {
    if (!TAL_DOT_VENOM_TOTAL) {
        TAL_DOT_VENOM_TOTAL = TAL_CreateTalent();
        TAL_DOT_VENOM_SPEED = TAL_CreateTalent();
        TAL_DOT_BURN_TOTAL = TAL_CreateTalent();
        TAL_DOT_BURN_TICKS = TAL_CreateTalent();
    };
    BuffSystem_Reset();
};

//######################################################
// DOT general methods and dot prototype
//######################################################

func void TAL_ModValue(var c_npc n, var int talent, var int value) {
    var int next; next = TAL_GetValue(n, talent) + value;
    if (next < 0) {
        TAL_SetValue(n, talent, 0);
    } else {
        TAL_SetValue(n, talent, next);
    };
};

//######################################################
// DOT tick methods
//######################################################

func void dot_venom_tick(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    //var lCBuff b; b = get(bh);

    // Check whether envenomed
    var int venom_total; venom_total = TAL_GetValue(n, TAL_DOT_VENOM_TOTAL);
    if (n.attribute[ATR_HITPOINTS] > 0) && (venom_total > 0) {
        // Get speed
        var int speed; speed = TAL_GetValue(n, TAL_DOT_VENOM_SPEED);
        if      (speed > venom_total) { speed = venom_total; }
        else if (speed <= 0) { speed = DOT_VENOM_RATE_DEFAULT; };
        TAL_ModValue(n, TAL_DOT_VENOM_TOTAL, -speed);

        // Deal damage and check for murder
        var int dot; dot = n.attribute[ATR_HITPOINTS_MAX] * speed / 100;
        ptr = Buff_GetNpcOrigin(bh);
        if (!ptr) { Npc_ChangeAttribute (n, ATR_HITPOINTS, -dot); }
        else {
            var c_npc o; o = _^(ptr);
            B_MagicHurtNpc(o, n, dot);
            if (n.attribute[ATR_HITPOINTS] <= 0) {
                Npc_SendPassivePerc (o, PERC_ASSESSMURDER, o, o);
            };
        };
    } else {
        TAL_SetValue(n, TAL_DOT_VENOM_TOTAL, 0);
        Buff_Remove(bh);
    };
};

func void dot_burn_tick(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    //var lCBuff b; b = get(bh);

    // Calculate dot
    var int burn_total; burn_total = TAL_GetValue(n, TAL_DOT_BURN_TOTAL);
    if (n.attribute[ATR_HITPOINTS] > 0) && (burn_total) > 0 {
        var int burn_tick; burn_tick = TAL_GetValue(n, TAL_DOT_BURN_TICKS);
        var int dot; dot = burn_total / burn_tick;
        TAL_ModValue(n, TAL_DOT_BURN_TOTAL, -dot);
        TAL_ModValue(n, TAL_DOT_BURN_TICKS, -1);

        // Deal damage and check for murder
        ptr = Buff_GetNpcOrigin(bh);
        if (!ptr) { Npc_ChangeAttribute (n, ATR_HITPOINTS, -dot); }
        else {
            var c_npc o; o = _^(ptr);
            B_MagicHurtNpc(o, n, dot);
            if (n.attribute[ATR_HITPOINTS] <= 0) {
                Npc_SendPassivePerc (o, PERC_ASSESSMURDER, o, o);
            };
        };
    } else {
        TAL_SetValue(n, TAL_DOT_BURN_TOTAL, 0);
        TAL_SetValue(n, TAL_DOT_BURN_TICKS, 0);
        Buff_Remove(bh);
    };
};

//######################################################
// DOT lCBuff's
//######################################################

instance dot_venom(lCBuff) {
    durationMS = 86400000;
    tickMS = DOT_TICK_RATE_MS;
    OnTick = SAVE_GetFuncID(dot_venom_tick);
};
instance dot_burn(lCBuff) {
    durationMS = 86400000;
    tickMS = DOT_TICK_RATE_MS;
    OnTick = SAVE_GetFuncID(dot_burn_tick);
};

//######################################################
// DOT apply / remove methods
//######################################################

// Venom is applied and removed in "counts"
func void dot_venom_apply(var c_npc npc, var int percentage, var c_npc origin) {
    Buff_RemoveAll(npc, dot_venom);
    TAL_ModValue(npc, TAL_DOT_VENOM_TOTAL, percentage);
    Buff_Apply(npc, dot_venom, origin);
};
func void dot_venom_remove(var c_npc npc, var int percentage) {
    TAL_ModValue(npc, TAL_DOT_VENOM_TOTAL, -percentage);
    if (TAL_GetValue(npc, TAL_DOT_VENOM_TOTAL) <= 0) {
        Buff_RemoveAll(npc, dot_venom);
        TAL_SetValue(npc, TAL_DOT_VENOM_TOTAL, 0);
    };
};

// Burn is applied by damage and can only be removed fully. It can be stacking or not
func void dot_burn_apply(var c_npc npc, var int damage, var int seconds, var c_npc origin) {
    Buff_RemoveAll(npc, dot_burn);
    TAL_SetValue(npc, TAL_DOT_BURN_TICKS, (1000 / DOT_TICK_RATE_MS) * seconds);
    TAL_ModValue(npc, TAL_DOT_BURN_TOTAL, damage);
    Buff_Apply(npc, dot_burn, origin);
    Wld_StopEffect_Ext("VOB_BURN", npc, npc, FALSE);
    Wld_PlayEffect ("VOB_BURN", npc, npc, 0, 0, 0, FALSE);
};
func void dot_burn_apply_nostack(var c_npc npc, var int damage, var int seconds, var c_npc origin) {
    var int current; current = TAL_GetValue(npc, TAL_DOT_BURN_TOTAL);
    if (damage > current) {
        // Add non-stacking damage
        dot_burn_apply(npc, damage - current, seconds, origin);
    } else {
        // Reset VFX and update origin, but do not reduce remaining dot
        dot_burn_apply(npc, 0, seconds, origin);
    };
};
func void dot_burn_remove(var c_npc npc) {
    Buff_RemoveAll(npc, dot_venom);
    TAL_SetValue(npc, TAL_DOT_BURN_TOTAL, 0);
    TAL_SetValue(npc, TAL_DOT_BURN_TICKS, 0);
    //Wld_StopEffect_Ext("VOB_BURN", npc, npc, FALSE);
};

//######################################################
// Magic wetness lCBuff (used in damage calculation)
//######################################################

instance magic_wet(lCBuff) {
    durationMS = 1000; // placeholder, replaced on apply
};

func void magic_wet_apply(var c_npc npc, var int count, var int seconds) {
    repeat(i, count); var int i;
        var int bh; bh = Buff_Apply(npc, magic_wet, npc);
        var lCBuff b; b = get(bh);
        b.durationMS = seconds * 1000;
    end;
};

//######################################################
// Fear duration remover (as AI_Flee can last a random amount of time)
//######################################################

instance fear_buff(lCBuff) {
    durationMS = 1000; // placeholder, replaced on apply
    OnRemoved = SAVE_GetFuncID(fear_buff_removed);
};

func void fear_buff_removed(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    var lCBuff b; b = get(bh);
    if (Npc_IsInState(n, ZS_MagicFlee)) {
        Npc_ClearAIQueue	(n);
        //B_ClearPerceptions	(n);
        Npc_PercDisable	(n,	PERC_ASSESSDAMAGE);
        Npc_PercDisable	(n,	PERC_ASSESSMAGIC);

        Npc_SetTarget 		(n, hero);
        AI_TurnToNpc		(n, hero);
        AI_PlayAni			(n, "T_WARN");
        if(n.guild < GIL_SEPERATOR_HUM)
        {
            AI_StartState(n,ZS_Attack,0,"");
        }
        else
        {
            AI_StartState(n,ZS_MM_Attack,0,"");
        };
    };
};

func void fear_buff_apply(var c_npc npc, var int seconds) {
    var int bh; bh = Buff_Apply(npc, fear_buff, npc);
    var lCBuff b; b = get(bh);
    b.durationMS = seconds * 1000;
};

//######################################################
// Light persister lCBuff
//######################################################

func void light_persister_removed(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    var lCBuff b; b = get(bh);
    Wld_StopEffect_Ext(b.name, 0, n, TRUE);
};

instance light_persister(lCBuff) {
    durationMS = 60000; // placeholder, replaced on apply
    OnRemoved = SAVE_GetFuncID(light_persister_removed);
};

func void light_persister_apply(var c_npc npc, var string visualFX, var int durationMinutes) {
    if (Npc_IsPlayer(npc)) {
        if (Buff_ApplyUnique(npc, light_persister, npc)) {
            var int bh; bh = Buff_Has(npc, light_persister);
            var lCBuff b; b = get(bh);
            b.durationMS = durationMinutes * 60000;
            b.name = visualFX;
        };
    };
};

//######################################################
// Special
//######################################################
/* 
func void well_rested_apply(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    if (Npc_IsPlayer(n)) {
        disableSaving = false;
        EnforceSavingPolicy();
    };
};

func void well_rested_removed(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh); if (!ptr) { return; }; var c_npc n; n = _^(ptr);
    if (Npc_IsPlayer(n)) {
        disableSaving = true;
        EnforceSavingPolicy();
    };
};

instance well_rested(lCBuff) {
    name = "";
    bufftype = BUFF_GOOD;
    durationMS = 10*1000;
    OnApply = SAVE_GetFuncID(well_rested_apply);
    OnRemoved = SAVE_GetFuncID(well_rested_removed);
};
*/
