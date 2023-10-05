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
} else {
    vspeed+=0.15
    if (instance_place(x,y-2,Player) && Player.vspeed>=-0.5 && !Player.dead) {
        soak=approach(lerp(soak,0,0.03),0,0.002)
        repeat (soak*10) {
            instance_create_moving(x,random_range(bbox_top,bbox_bottom),WaterSplashDrop,random(4),180+random_range(-20,20))
            instance_create_moving(x+32,random_range(bbox_top,bbox_bottom),WaterSplashDrop,random(4),random_range(-20,20))
        }
        if (!spong) {spong=6 if (soak>0.1) snd=sound_play_ex("602902__everythingsounds__wring-out",soak)}
        else {
            if (Player.input_h!=0) {
                spong+=1
            } else spong=5
        }
    } else spong=0
}

if (spong>5) {
    spong=1
    sound_play("sponge"+string(irandom(3)))
}
if (spong==0 && snd) sound_stop(snd)

free=place_free(x,y)
obot=y+32*image_yscale
image_yscale=1+soak
y-=y+32*image_yscale-obot
if (!place_free(x,y) && free) {
    soak=oldsoak
    image_yscale=1+soak
    y=obot-32*image_yscale
}
move_outside_solid(90,1)
image_blend=merge_color($ffffff,$bbbbbb,soak)

if (bbox_top>PoolWater.y) {
    if (!underwater) instance_create(x+16,PoolWater.y,WaterSplash1)
    underwater=1
} else {
    if (underwater) instance_create(x+16,PoolWater.y,WaterSplash2)
    underwater=0
}

hspeed=0
if (!place_free(x,y+1)) {
    xmove=Player.input_h*!Player.dead
    if (instance_place(x-xmove,y,Player) && place_free(x+xmove,y)) {
        hspeed=xmove
        if (!sndd) sndd=sound_loop_ex("drag",1,0.7)
    }
}

if (hspeed!=0) {if (!place_free(x+hspeed,y)) {
    move_contact_solid_hv(hspeed,0)
    hspeed=0
}} else if (sndd) {sound_stop(sndd) sndd=0}

if (vspeed!=0) if (!place_free(x,y+vspeed)) {
    if (vspeed>2 && bbox_bottom<PoolWater.y) {
        sound_play_pitch("Breakbone_03")
        repeat (60) instance_create_moving(random_range(bbox_left,bbox_right),bbox_bottom,WaterSplashDrop,random(4),random_range(0,180))
    }
    move_contact_solid_hv(0,vspeed)
    vspeed=0
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
underwater=bbox_top>PoolWater.y
soak=underwater
