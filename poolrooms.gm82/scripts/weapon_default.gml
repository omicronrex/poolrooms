if (instance_number(Bullet)<4) {
    yy=y-2*vflip

    if (yy>PoolWater.y) i=instance_create(x,yy,WaterBullet)
    else i=instance_create(x,yy,Bullet)

    i.owner=id

    i.hspeed=facing*16*dt*slomo
    i.direction+=sprite_angle

    sound_play_slomo("sndShoot")
}
