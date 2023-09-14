#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
e1=sound_kind_effect(0,se_reverb)
e2=sound_kind_effect(0,se_echo)
sound_effect_options(e2,1,0.3)

e6=sound_kind_effect(3,se_reverb)
e7=sound_kind_effect(3,se_echo)
sound_effect_options(e2,1,0.3)

e3=sound_kind_effect(1,se_lowpass)
sound_effect_options(e3,0,22000)
e4=sound_kind_effect(0,se_lowpass)
sound_effect_options(e4,0,22000)
e5=sound_kind_effect(3,se_lowpass)
sound_effect_options(e4,0,22000)

damp=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vol<1) {
    vol=min(1,vol+1/100)
    sound_volume(global.music_instance,vol)
}

with (Player) if (onwater) other.damp=min(0.9,other.damp+0.05) else other.damp=max(0,other.damp-0.05)

sound_effect_options(e1,1,lerp(-1000,-2000,damp))
sound_effect_options(e1,3,lerp(14,1,damp))
sound_effect_options(e6,1,lerp(-1000,-2000,damp))
sound_effect_options(e6,3,lerp(14,1,damp))

sound_effect_options(e2,1,lerp(0.7,0,damp))
sound_effect_options(e7,1,lerp(0.7,0,damp))

sound_effect_options(e3,0,lerp(22000,1,damp))
sound_effect_options(e4,0,lerp(22000,1,damp))
sound_effect_options(e5,0,lerp(22000,1,damp))
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.music!="pool" || sound_background_instance()!=global.music_instance) {
    global.music_instance=sound_loop_ex("pool",0)
    sound_set_pos(global.music_instance,random(1),unit_unitary)
    vol=0
}

global.music="pool"
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damp=0
