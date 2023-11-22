#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha+=1/5
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,0.2+alpha*0.7,0.2+alpha,alpha*180,$ffffff,alpha)
draw_sprite_ext(sprite_index,0,x,y,0.2+alpha*0.7,0.2+alpha,-alpha*70,$ffffff,alpha)
draw_sprite_ext(sprEyeVeins,0,x,y,2,1.8,0,$8000ff,alpha-1.2)
draw_set_blend_mode(0)
