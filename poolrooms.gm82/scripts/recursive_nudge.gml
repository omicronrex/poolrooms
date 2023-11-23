with (MovingSolid) if (y<other.y) if (instance_place(x,y,other.id)) {
    do y-=1 until (!instance_place(x,y,other.id))
    recursive_nudge()
    if (!place_free(x,y)) {
        if (object_index==CubeFloater) instance_destroy()
    }
}
