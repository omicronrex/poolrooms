with (MovingSolid) if (y<other.y) if (instance_place(x,y,other.id)) {
    do y-=1 until (!instance_place(x,y,other.id))
    recursive_nudge()
}
