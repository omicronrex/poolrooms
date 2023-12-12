///custom_window_border(width,height)
//you can draw a custom fullscreen window border in this script
//screen size is passed via the arguments
var width,height;

width=argument0
height=argument1

if (room==rmInit || room==rmCapcom || room=rmClear) exit

var tex,w,r,s1,s2,v;

v=view_yview

if (global.flip_screen) v=-v

s1=surface_set("border surf 1",32,32)
draw_background_tiled(tilePool,0,-v)
s2=surface_set("border surf 2",32,32)
draw_background_tiled(tilePool90,v,0)
surface_reset_target()

tex=surface_get_texture(s1)
tex90=surface_get_texture(s2)
w=global.woffset
r=32*(height/608)

d3d_set_projection_simple(0.5,0.5,width,height,0,0.3,-100,0,100,0)

texture_set_interpolation(settings("filter"))

d3d_draw_floor(w,0,-32,0,height,-32,tex,-w/r,height/r)
d3d_draw_wall(w,height,-32,w,0,0,tex90,height/r,1)

d3d_draw_floor(w,0,0,width-w,height,0,tex,round((width-w*2)/r),height/r)

d3d_draw_floor(width-w,0,-32,width,height,-32,tex,w/r,height/r)
d3d_draw_wall(width-w,height,-32,width-w,0,0,tex90,height/r,-1)

texture_set_interpolation(0)

var a;

a=0

with (Pirror) {
    if (active==1) a=PoolWater.y/-200
    if (active==2) a=1
    if (active==3) a=Player.hydrolitis
}

with (FadeIn) a=alpha

d3d_set_projection_ortho(0,0,width,height,0)
draw_rect(0,0,width,height,0,a)

draw_set_blend_mode(bm_subtract)
d3d_set_color_mask(1,1,1,0)
draw_rectangle_color(0,0,w,height,$dddddd,0,0,$dddddd,0)
draw_rectangle_color(width-w,0,width,height,0,$dddddd,$dddddd,0,0)
draw_set_blend_mode(0)
d3d_set_color_mask(1,1,1,1)
