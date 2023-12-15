//save collected items
with (Item) {
    if (collected) {
        gottem=1
        sound_play("sndItem")
    }
}

instance_activate_object(ItemBlock)
with (ItemBlock) event_user(0)
