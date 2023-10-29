#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
y+=32

tex=sprite_get_texture(sprElevatorTexture,0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    if (y>ystart) {
        y-=1
        recursive_nudge()
    }
} else {
     if (y<ystart+32) y+=1
}
