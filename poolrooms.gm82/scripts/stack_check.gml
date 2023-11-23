with (MovingSolid) if (y<other.y) if (instance_place(x,y+1,other.id)) {
    return stack_check()
}
if (object_index==Elevator) return 1
return place_free(x,y-1)
