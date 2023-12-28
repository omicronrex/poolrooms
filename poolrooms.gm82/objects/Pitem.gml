#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0
image_yscale=0

set=0

attach=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=lerp(min(1,image_xscale+0.01),1,1/20)
image_yscale=image_xscale

if (!visible) {
    vspeed=-5
    gravity=0.2
    if (i==1) {sprite_index=sprItem1 hspeed=-0.8}
    if (i==2) {sprite_index=sprItem2 hspeed=-0.3}
    if (i==3) {sprite_index=sprItem3 hspeed=0.3}
    if (i==4) {sprite_index=sprItem4 hspeed=0.8}
    visible=1
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!attach) {
    if (instance_place(x,y,FloatBox)) {
        attach=FloatBox.id
        offx=x+16+hspeed-(attach.x+48)
        offy=-30
        offa=attach.angle
        speed=0 gravity=0
    }
}

if (attach) {
    x=attach.x+48+pivot_pos_x(offx,offy,attach.angle-offa)-16
    y=attach.y+32+pivot_pos_y(offx,offy,attach.angle-offa)-32

}
