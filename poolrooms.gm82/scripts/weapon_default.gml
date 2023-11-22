var owned,yy;

owned=0
with (Bullet) if (owner==other.id) owned+=1

if (owned<4) {
    yy=y-2*vflip

    if (yy>PoolWater.y) i=instance_create(x,yy,WaterBullet)
    else i=instance_create(x,yy,Bullet)

    i.owner=id

    i.hspeed=facing*16*dt*slomo
    i.direction+=sprite_angle

    sound_play_slomo("sndShoot")

    with (Pirror) if (active!=2 && active!=3) {
        if (yy>PoolWater.y) i=instance_create(800-Player.x,yy,WaterBullet)
        else i=instance_create(800-Player.x,yy,Bullet)

        i.owner=id

        i.hspeed=Player.facing*-16*dt
    }
}
