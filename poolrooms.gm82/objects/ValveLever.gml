#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (valve) event_perform(ev_collision,Player)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field valve: instance
//field path: path
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx=x+16
yy=y+32

draw_set_color($80)
draw_path(path,xx+1,yy+1,0)
draw_set_color($8080ff)
draw_path(path,xx-1,yy-1,0)
draw_set_color($ff)
draw_path(path,xx,yy,0)
draw_set_color($ffffff)

draw_sprite(sprValveLever,0,x,y)
