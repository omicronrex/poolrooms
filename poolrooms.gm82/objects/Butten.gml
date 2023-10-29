#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
press=0side=0
vpress=0
vside=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
press=0
side=0
with (MovingSolid) if (instance_place(x,y,other.id)) with (other) {
    press+=1
    side+=(x-other.x)
}
with (Player) if (instance_place(x,y,other.id)) with (other) {
    press+=1
    side+=x+16-other.x
}

if (press) {side/=press press=1 Elevator.go=1}
else Elevator.go=0

vpress=lerp(vpress,press,1/4)
vside=lerp(vside,side,1/4)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field elevator: instance
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprFloorButton,0,x+16,y+27+5*vpress-abs(vside*0.08),1,1,vside/2,$ffffff,1)
