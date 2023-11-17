#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_rect(0,0,800,608,0,alpha)

alpha-=0.02

if (alpha<0) instance_destroy()
