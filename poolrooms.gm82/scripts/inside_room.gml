///inside_room()

//workaround for instances without a sprite
if (bbox_right-bbox_left+bbox_bottom-bbox_top == 0)
return x >= 0
    && x < 0+room_width
    && y >= 0
    && y < 0+room_height

return bbox_right >= 0
    && bbox_left < 0+room_width
    && bbox_bottom >= 0
    && bbox_top < 0+room_height
