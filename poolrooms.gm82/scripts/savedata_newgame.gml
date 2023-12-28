///savedata_newgame(slot)
///savedata_newgame(slot,diff)
//creates a new savefile and starts it

//clear it out
savedata_select(argument0)
savedata_default()

//set difficulty
if (argument_count==2) difficulty=argument[1]
savedata("diff",difficulty)

//go
savedata_load()
