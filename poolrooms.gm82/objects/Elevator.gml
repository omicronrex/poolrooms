#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
going=0
snd=-1

sprite_index=sprElevator
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    if (!going) {
        if (snd) sound_stop(snd)
        snd=sound_play_paused("elevator-up")
        sound_set_pos(snd,(1-(y-ystart)/32)*0.64,unit_seconds)
        sound_resume(snd)
    }
    going=1
    if (y>ystart) {
        if (stack_check()) {
            y-=1
            recursive_nudge()
        }
    }
} else {
    if (going) {
        if (snd) sound_stop(snd)
        snd=sound_play_paused("elevator-down")
        sound_set_pos(snd,((y-ystart)/32)*0.64,unit_seconds)
        sound_resume(snd)
    }
    going=0
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
