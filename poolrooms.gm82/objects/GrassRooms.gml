#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
img=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    freeze_player()
    savedatap("woohoo",1)
    angle=0
    rot=0
    active=1
    PoolWater.visible=0
}
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    angle=min(180,angle+180/120)
    rot-=7
    f=dsin(angle)

    draw_background(bgGrassrooms,0,(1000-608)*-(1-f))
    draw_sprite_ext(sprPlayerFall,floor(img),400,608-400*f,1,1,rot,$ffffff,1)

    img+=0.5

    if (angle==180) {
        unfreeze_player()
        unlock_controls()
        Player.vspeed=7
        Player.x=1376
        instance_destroy()
        PoolWater.visible=1
    }
}
