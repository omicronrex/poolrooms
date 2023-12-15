#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,Player)) {
    PoolWater.y=PoolWater.ystart
    global.water_level=PoolWater.y
}
