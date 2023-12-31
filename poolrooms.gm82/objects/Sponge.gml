#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spong=0
snd=0
sndd=0

tex=sprite_get_texture(sprite_index,0)

soak=0
unsoaking=0
underwater=0
checksolid=0

bob=egg(4096)
sponge=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oldsoak=soak
if (bbox_bottom>PoolWater.y) {
    soak=approach(lerp(soak,1,0.03),1,0.002)
    vspeed=vspeed*0.98+0.08
    if (instance_place(x,y-2,Player) && Player.vspeed>=-0.5 && !Player.dead) {
        if (!spong) spong=6
        else {
            if (Player.input_h!=0) spong+=1
            else spong=5
        }
    } else spong=0
    unsoaking=0
} else {
    vspeed+=0.15
    if (instance_place(x,y-2,Player) && Player.vspeed>=-0.5 && !Player.dead) {
        soak=approach(lerp(soak,0,0.03),0,0.002)
        if (!unsoaking) if (soak>0.1) snd=sound_play_ex("602902__everythingsounds__wring-out",soak)
        unsoaking=1
        repeat (soak*10) {
            instance_create_moving(x,random_range(bbox_top,bbox_bottom),WaterSplashDrop,random(4),180+random_range(-20,20))
            instance_create_moving(x+32,random_range(bbox_top,bbox_bottom),WaterSplashDrop,random(4),random_range(-20,20))
        }
        if (!spong) spong=6
        else {
            if (Player.input_h!=0) {
                spong+=1
            } else spong=5
        }
    } else {spong=0 unsoaking=0}
}

if (spong>5) {
    spong=1
    sound_play("sponge"+string(irandom(3)))
    if (bob && !sponge) {
        sponge=1
        sound_play("spongebob")
        tex=sprite_get_texture(sprBob,1)
    }
}
if (spong==0 && snd) sound_stop(snd)

free=place_free(x,y)
obot=y+32*image_yscale
image_yscale=1+soak
y-=y+32*image_yscale-obot
if ((!place_free(x,y) && free) || !stack_check()) {
    soak=oldsoak
    image_yscale=1+soak
    y=floor(obot-32*image_yscale)
    recursive_nudge()
}
if (!place_free(x,y)) {
    yo=y
    move_outside_solid(90,4)
    if (!place_free(x,y)) y=yo
    move_outside_solid(90,1)
    recursive_nudge()
}
image_blend=merge_color($ffffff,$bbbbbb,soak)

if (soak>oldsoak) instance_create(irandom_range(bbox_left,bbox_right),irandom_range(max(bbox_top,PoolWater.y),bbox_bottom),Bubbles)

if (bbox_top>PoolWater.y) {
    if (underwater==1) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash1)
    underwater=2
} else if (bbox_bottom>PoolWater.y) {
    if (underwater==0) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash1)
    if (underwater==2) instance_create(mean(bbox_left,bbox_right),PoolWater.y,WaterSplash2)
    underwater=1
} else {
    underwater=0
}

hspeed=0
if (!place_free(x,y+1) && Player.bbox_bottom>bbox_top+1) {
    xmove=Player.input_h*!Player.dead
    with (FloatBox) if (y>ygo) x-=999
    with (CubeFloater) if (y>ygo) x-=999
    if (instance_place(x-xmove,y,Player)) if (place_free(x+xmove,y) && !instance_place(x,y-2,MovingSolid)) {
        hspeed=xmove
        if (!sndd) sndd=sound_loop_ex("drag",1,0.7)
    }
    with (FloatBox) if (y>ygo) x+=999
    with (CubeFloater) if (y>ygo) x+=999
}

if (hspeed!=0) {if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}} else if (sndd) {sound_stop(sndd) sndd=0}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>1.5) {
        sound_play_pitch("Breakbone_03")
        if (bbox_bottom<PoolWater.y) repeat (60) instance_create_moving(random_range(bbox_left,bbox_right),bbox_bottom,WaterSplashDrop,random(4),random_range(0,180))
    }
    y=round(y)
    move_contact_solid_hv(0,vspeed)
    vspeed=0
}

if (checksolid) {
    if (!place_free(x,y)) {
        move_outside_solid(90,1)
        move_outside_solid(270,1)
        vspeed=0
    } else checksolid-=1
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bbox_bottom>PoolWater.y) underwater=1
if (bbox_top>PoolWater.y) underwater=2
if (underwater && place_free(x,y-1)) soak=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sponge) draw_sprite_ext(sprBob,0,x,floor(y),0.5,image_yscale/2,0,image_blend,1)
else draw_sprite_ext(sprite_index,0,x,floor(y),image_xscale,image_yscale,0,image_blend,1)
