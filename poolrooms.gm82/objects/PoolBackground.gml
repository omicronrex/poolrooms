#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fogcol=color_reverse($b8af86)

tex=background_get_texture(tilePool)

random_set_seed(savedatap("bg seed")+room)

repeat (room_width*room_height/20000) instance_create(irandom_range(0,room_width),irandom_range(0,room_height),PoolBgCube)

repeat (room_width/150) instance_create(irandom_range(0,room_width),0,PoolBgCyl)

model1=d3d_model_create()

d3d_model_wall(model1,32,32,0,room_width-32,32,1000,(room_width-64)/32,1000/32)
d3d_model_wall(model1,32,32,0,32,room_height-32,1000,(room_height-64)/32,1000/32)
d3d_model_wall(model1,32,room_height-32,0,room_width-32,room_height-32,1000,(room_width-64)/32,1000/32)
d3d_model_wall(model1,room_width-32,32,0,room_width-32,room_height-32,1000,(room_height-64)/32,1000/32)

with (PoolBgCube) {
    d3d_model_block(other.model1,x-w,y-w,z-w,x+w,y+w,z+w,size*2,size*2)
    instance_destroy()
}

model2=d3d_model_create()

with (PoolBgCyl) {
    d3d_model_cylinder(other.model2,x,-z+d,room_height,x+d,-z,0,d*pi/32,room_height/32,0,16)
    instance_destroy()
}

randomize()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_model_destroy(model1)
d3d_model_destroy(model2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=surface_set("hqbg",1600,1216)
d3d_start()
draw_clear(fogcol)

d3d_set_projection_simple(view_xview,view_yview,800,608,0,0.3,-200,0,1100,0)
d3d_set_fog(1,fogcol,500,1500)

texture_set_repeat(1)
texture_set_interpolation(1)
d3d_model_draw(model1,0,0,0,tex)
d3d_transform_add_rotation_x(90)
d3d_model_draw(model2,0,0,0,tex)
d3d_transform_set_identity()

d3d_set_fog(0,0,0,0)
d3d_end()
surface_set_target(application_surface)
d3d_set_projection_ortho(0,0,800,608,0)
d3d_set_alphablend(0)
draw_surface_stretched(s,0,0,800,608)
d3d_set_alphablend(1)
texture_set_interpolation(0)

camera_apply()
