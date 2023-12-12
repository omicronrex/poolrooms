#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
flip=0

time=irandom(10000)
distortion=24
colorto=$4d7d08

x=-32
image_xscale=room_width/32+32
image_yscale=(room_height/32)*2

onwater=savedata("onwater")
submerged=savedata("submerged")
if (savedata("wlevelRoom")==room) {
    global.water_level=savedata("wlevel")
    y=global.water_level
} else global.water_level=y

with (Elevator) y+=32

repeat (2) {
    with (FloatBox) {
        do {
            yo=y
            y=approach(y,PoolWater.y-16,32)
            if (!place_free(x,y)) {
                y=yo break
            }
        } until (abs(y-(PoolWater.y-16))<16)
    }
    with (CubeFloater) {
        do {
            yo=y
            y=approach(y,PoolWater.y-16,32)
            if (!place_free(x,y)) {
                y=yo break
            }
        } until (abs(y-(PoolWater.y-16))<16)
    }
    with (Brock) {
        repeat (room_height/32) {
            yo=y
            y+=32
            if (!place_free(x,y)) {
                y=yo break
            }
        }
    }
    with (Clown) {
        repeat (room_height/32) {
            yo=y
            y+=32
            if (!place_free(x,y)) {
                y=yo break
            }
        }
    }
    with (Sponge) {
        repeat (room_height/32) {
            yo=y
            y+=32
            if (!place_free(x,y)) {
                y=yo break
            }
        }
    }
    with (Floater) {
        do {
            yo=y
            y=approach(y,PoolWater.y-16,32)
            if (!place_free(x,y)) {
                y=yo move_contact_solid(180-90*sign(y-(PoolWater.y-16)),32) break
            }
        } until (abs(y-(PoolWater.y-16))<16)
    }
}

with (FloatSpike) y=median(ystart,PoolWater.y-16,ystart+32)
with (FallSpike) y=median(ystart-32,PoolWater.y-16,ystart)

texTile=background_get_texture(tilePool)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=3

n=surface_set("noise",128,128)
draw_clear($0)
draw_set_blend_mode(bm_add)
    texture_set_interpolation(1)
        draw_background_tiled_extra(bgNoise1,time*0.05546,time*0.051235,1,1,0,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise1,-time*0.05546,-time*0.051235,1,1,0,$303030,1,0,0)

        draw_background_tiled_extra(bgNoise2,time*0.025346,-time*0.0256456,1,1,0,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise2,-time*0.025346,time*0.0256456,1,1,0,$303030,1,0,0)

        draw_background_tiled_extra(bgNoise3,-time*0.1231,time*0.168156,1,1,90,$303030,1,0,0)
        draw_background_tiled_extra(bgNoise3,time*0.1231,-time*0.168156,1,1,90,$303030,1,0,0)
    texture_set_interpolation(0)
draw_set_blend_mode(0)
surface_reset()

y=approach(lerp(y,global.water_level,1/100),global.water_level,1/10)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field flip: bool

global.flip_screen=0
if (flip) {
    PoolBackground.tex=background_get_texture(tilePoolFlip)
    flip_player(-1)
    global.flip_screen=1
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
flip_player(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dy=median(-608,y-view_yview,608)

s=surface_get("clone",global.APPwidth,global.APPheight)
surface_copy(s,0,0,application_surface)

surface_set_target(s)

draw_make_opaque()

if (room==rmTitle) {
    draw_set_blend_mode(bm_subtract)
    draw_background(bgTitleMask,0,0)
    draw_set_blend_mode(0)
}

surface_set_target(application_surface)

shader_pixel_set(global.shader_water)

texture_set_stage("Brick",texTile)
texture_set_stage_interpolation("Brick",1)
texture_set_stage("Water",surface_get_texture(s))
texture_set_stage_interpolation("Water",1)
texture_set_stage_repeat("Water",tr_clamp,tr_clamp,0)
texture_set_stage("Manifold",surface_get_texture(n))
texture_set_stage_repeat("Manifold",tr_wrap,tr_wrap,0)
texture_set_stage_interpolation("Manifold",1)
shader_pixel_uniform_color("colorto",colorto)
shader_pixel_uniform_f("distort",distortion/800,distortion/608)
shader_pixel_uniform_f("surface",-view_xview/global.APPwidth,dy/global.APPheight)
shader_pixel_uniform_f("outsideoff",-view_xview/global.APPwidth,-view_yview/global.APPheight)
shader_pixel_uniform_f("cropmode",room!=rmTitle)

var a;

a=0

with (Pirror) {
    if (active==1) a=PoolWater.y/-200
    if (active==2) a=1
    if (active==3) a=Player.hydrolitis
}

with (FadeIn) a=alpha

shader_pixel_uniform_f("cropfade",saturate(a))

texture_set_interpolation(1)
draw_primitive_begin(pr_trianglestrip)
draw_vertex_texture_color(-0.5,-0.5+dy,0,0,$33,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy,1,0,$33,1)
draw_vertex_texture_color(-0.5,-0.5+dy+608,0,1,$ff,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy+608,1,1,$ff,1)
draw_vertex_texture_color(-0.5,-0.5+dy+1216,0,2,$ff,1)
draw_vertex_texture_color(-0.5+800,-0.5+dy+1216,1,2,$ff,1)
draw_primitive_end()
texture_set_interpolation(0)

if (room==rmMenu) {
    shader_pixel_uniform_f("surface",-view_xview/global.APPwidth,272/global.APPheight)

    draw_set_color($33)
    draw_quad(96,272,128,192,-1,96/800,(0)/608,(96+128)/800,(192)/608)
    draw_quad(336,272,128,192,-1,336/800,(0)/608,(336+128)/800,(192)/608)
    draw_quad(576,272,128,192,-1,576/800,(0)/608,(576+128)/800,(192)/608)
    draw_set_color($ffffff)
}

shader_reset()

with (FileMenu) event_user(0)
with (OptionsMenu) event_user(0)
with (KeyboardMenu) event_user(0)
with (JoystickMenu) event_user(1)

if (!instance_exists(Pirror)) with (Player) if (hydrolitis>0 && !dead) draw_healthbar(x-view_xview-50,y-view_yview-30,x-view_xview+50,y-view_yview-20,hydrolitis*100,0,$408000,$408000,0,1,1)

if (flip) {
    surface_copy(s,0,0,application_surface)
    surface_set_target(s)

    draw_make_opaque()
    surface_set_target(application_surface)

    d3d_set_projection_ortho(0,0,global.APPwidth,global.APPheight,0)
    draw_surface_ext(s,0,global.APPheight,1,-1,0,$ffffff,1)
}
