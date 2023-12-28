#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
active=0
t=0
love=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active==0) if (distance_to_object(Player)<24) {
    if (has_item("Item1") || has_item("Item2") || has_item("Item3") || has_item("Item4")) {
        lock_controls()
        active=1
    }
}

if (active==1) {
    //good ending
    t+=1
    if (t==50) {
        sound_play("item get 1")
        if (has_item("Item1")) (instance_create(Player.x,y-8,Pitem)).i=1
        if (has_item("Item2")) (instance_create(Player.x,y-8,Pitem)).i=2
        if (has_item("Item3")) (instance_create(Player.x,y-8,Pitem)).i=3
        if (has_item("Item4")) (instance_create(Player.x,y-8,Pitem)).i=4
    }
    if (t>150) love=lerp(love,3,1/30)
    if (t<200) sound_set_music_volume(1-t/100)
    if (t==200) {
        sound_play_music("interlude",0)
        sound_set_music_volume(1)
    }
    if (t>300) {
        PoolWater.vspeed=max(-0.3,PoolWater.vspeed-0.002)
        global.water_level=PoolWater.y
    }
    if (t>3700) {
        room_goto(rmClear)
    }
}

if (active==2) {
    //bad ending
    if (t<50) t+=0.125
    else if (t<100) t+=0.25
    else if (t<200) t+=0.5
    else t+=1

    if (t<50) {
        PoolWater.distortion=max(0,PoolWater.distortion-0.5)
        PoolWater.colorto=merge_color($4d7d08,$ffffff,t/50)
    }
    if (t==50) PoolWater.visible=0
    if (t==590) {
        instance_create(400,320,Flare)
    }
    if (t==600) {
        savedatap("clear",true)
        savedata("diff",2)
        savedatap("diff",2)
        difficulty=2
        savedatap("time",savedatap("time")+50*60*60*3)
        autosave_asap()
        savedata_write()
        settings_write()
        game_end()
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Player.x=min(Player.x,400-10)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.owner==Player.id && !active) {
    instance_destroy_id(Bullet)

    sound_set_music_volume(0)

    sound_kind_stop(0)

    sound_play("sndDeath")

    global.water_level=-608

    Player.fucked=1

    with (EndBlockMarker) instance_create(x,y,Block)

    window_set_showicons(0)

    i=instance_create(x,y,BloodEmitter)
    i.hspeed*=-1

    active=3
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=2

sound_volume(sndDrown,0)
sound_play("pulse")

x=Player.x+Player.facing*3
y=Player.y-5

instance_destroy_id(GameOver)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active==2 || active==3) {
    exit
}

x=800-Player.drawx
y=Player.drawy

sprite_index=Player.sprite_index
image_index=Player.image_index
image_xscale=-(Player.image_xscale)

draw_self()

draw_sprite_ext(sprLove,0,400,y-32,love,love,0,$ffffff,1)
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)

if (active==1) {
    alpha=PoolWater.y/-200
    draw_rect(0,0,800,608,0,alpha)
}

if (active==2) {
    draw_clear(0)

    scale=cosine(0,1,t/600)
    alpha=t/500
    mouth=cosine(0,100,max(0,t-400)/200)

    godx=lerp(x,400,scale)
    gody=lerp(y,330,scale)
    godscale=scale+0.02
    godalpha=0.7*(alpha-0.5)*2
    eyescale=1+scale*10
    eyeoff=0.5-0.5*eyescale

    draw_set_blend_mode(bm_add)
    repeat (2) {
        draw_sprite_ext(sprGod,0,godx,gody-mouth/3,godscale,godscale,0,$ffffff,0.7)
        draw_sprite_ext(sprGod,1,godx,gody-mouth/3,godscale,godscale,0,$ffffff,godalpha)
        draw_sprite_ext(sprGod,2,godx,gody+mouth*2,godscale,godscale,0,$ffffff,godalpha)
    }
    draw_set_blend_mode(0)

    draw_sprite_ext(sprPlayerEyes,1,godx-77*godscale+eyeoff,gody-131*godscale+eyeoff,eyescale,eyescale,0,$ffffff,(0.4-alpha)*4)
    draw_sprite_ext(sprPlayerEyes,1,godx+55*godscale+eyeoff,gody-140*godscale+eyeoff,eyescale,eyescale,0,$ffffff,(0.4-alpha)*4)

    with (Flare) event_user(0)
}

if (active==3) {
    draw_rect(0,0,800,608,0,Player.hydrolitis)
    draw_sprite_ext(sprPlayerEyes,0,Player.drawx,Player.drawy,Player.facing,1,0,$ffffff,Player.hydrolitis*2)
}

texture_set_interpolation(0)
