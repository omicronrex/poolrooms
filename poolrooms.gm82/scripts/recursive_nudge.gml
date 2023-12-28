with (MovingSolid) if (y<other.y) if (instance_place(x,y+1,other.id)) {
    vspeed=0 while (instance_place(x,y,other.id)) y-=1
    recursive_nudge()
    checksolid=10
    if (!place_free(x,y)) {
        if (object_index==CubeFloater) instance_destroy()
    }
}
