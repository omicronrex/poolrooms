//check if the player needs to die from getting pushed inside a wall
//returns whether the player was killed

if (!object_is_child_of(Player)) with (Player) check_crush()
else {
    ox=image_xscale
    oy=image_yscale
    image_xscale*=4/6
    image_yscale*=8/11
    if (distance_to_object(other.id)<4+other.speed) if (!place_free(x,y))  {
        kill_player()
        return 1
    }
    image_xscale=ox
    image_yscale=oy

    if (!place_free(x,y)) try_unstuck()
}

return 0
