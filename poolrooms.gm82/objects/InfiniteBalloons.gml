#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_place(x,y,CubeFloater)) {
    i=instance_create(x,y,CubeFloater)
    if (!irandom(256)) i.cor=World.maxcolor1
    else i.cor=make_color_hsv(irandom(255),255,255)
}
