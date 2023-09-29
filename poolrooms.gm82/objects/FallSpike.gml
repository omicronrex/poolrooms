#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ygo=PoolWater.y-18+choose(-2,2)

if (y<ygo) vspeed+=0.15 else vspeed=vspeed*0.96-0.08

vspeed=median(-7,vspeed,7)

y=median(ystart-32,y+vspeed,ystart)-vspeed
