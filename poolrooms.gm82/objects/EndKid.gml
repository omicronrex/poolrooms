#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
main=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (main) if (global.key_pressed[key_shoot]) {
    instance_create(x,y-8,EndBullet)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field image_speed: number
//field main: bool
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_sprite_ext(sprPartSphere,0,x+20,y+30,3,1,0,0,0.5)
texture_set_interpolation(0)
draw_self()
