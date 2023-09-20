///move_player_object(x,y,check place free,object/id)
//move a specific player object to a different location
//this is necessary due to sprite smoothing
var dx,dy,a;

with (argument3) {
    dx=argument0-x dy=argument1-y

    if (argument2) {
        x+=dx
        y+=dy
        instance_activate_around_player()
        a=place_free(x+hspeed,y+vspeed)
        x-=dx
        y-=dy

        if (!a && point_distance(0,0,dx,dy)<20) {
            //small distance - let's just move towards it instead
            move_contact_solid_hv(dx,0)
            move_contact_solid_hv(0,dy)
            dx=dx-x
            dy=dy-y
        }
    }
    else a=1
    if (a) {
        if (frozen) {
            //if the player isn't simulating, just move directly to position
            x=argument0
            y=argument1
            oldx=x oldy=y
            newx=x newy=y
            oldbowx=x oldbowy=y
            newbowx=x newbowy=y
            drawx=x drawy=y
        } else {
            //move by delta to keep animations smooth
            oldx+=dx oldy+=dy
            newx+=dx newy+=dy
            oldbowx+=dx oldbowy+=dy
            newbowx+=dx newbowy+=dy
            x+=dx y+=dy
            drawx+=dx drawy+=dy
        }
        return 1
    }
}

return 0
