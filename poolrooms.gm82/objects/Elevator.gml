#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0

sprite_index=sprElevator
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    if (y>ystart) {
        if (stack_check()) {
            y-=1
            recursive_nudge()
        }
    }
} else {
     if (y<ystart+32) y+=1
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    repeat (32) if (y>ystart) {
        y-=1
        recursive_nudge()
    }
}
