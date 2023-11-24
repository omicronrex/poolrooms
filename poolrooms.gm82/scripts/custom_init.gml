//you can put any custom game start code here

global.shader_water=sh_water()
global.shader_gameover=sh_gameover()
global.shader_rain=sh_rain()

globalvar onwater,submerged,bubbles,sndDrown,sndEar;

global.water_level=0

m=d3d_model_create()
d3d_model_wall(m,0,0,0,32,0,16,1,0.5)
d3d_model_wall(m,32,0,0,32,32,16,1,0.5)
d3d_model_wall(m,32,32,0,0,32,16,1,0.5)
d3d_model_wall(m,0,32,0,0,0,16,1,0.5)
d3d_model_floor(m,0,0,0,32,32,0,1,-1)
d3d_model_floor(m,0,32,16,32,0,16,1,-1)
d3d_model_cylinder(m,10,10,16,22,22,32,-0.03,-0.03,0,4)
global.mod_pisten=m
