//writes memory savedata to disk
var b,f;

if (savedatap("exists")) {
    if (savedatap("backup")) {
        savedatap("backup",false)
        file_delete(global.backfile)
        file_copy(global.savefile,global.backfile)
    }

    b=buffer_create()
    buffer_write_hex(b,ds_map_write(global.savemap_persistent))
    if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
    buffer_save(b,global.savefile)
    buffer_destroy(b)

    if (global.gen_thumb_cachebg) {
        background_save(global.gen_thumb_cachebg,global.savefolder+global.savesig+".png")
        background_delete(global.gen_thumb_cachebg)
        global.gen_thumb_cachebg=noone
    }
}
