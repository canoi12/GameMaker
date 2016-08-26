/// scr_boss1_shoot_state()

timer -= 1;

if(timer <= 0 and count > 0)
{
    timer = room_speed/3;
    var bala = choose(instance_create(x-9,y+16,obj_bala_miniBoss),instance_create(x+21,y-7,obj_bala_miniBoss));
    count -= 1;
}

if(count <= 0 and !instance_exists(obj_bala_miniBoss)){
    laserPosYinit = obj_nave.y - 200
    laserPosy = laserPosYinit;
    laserPosYfim = laserPosYinit+400;
    
    laserPosx = obj_nave.x;
    ataque2 = true;
    k = 10;
    timer = 30;
    count = 3;
    var odds = irandom_range(0,2);
    if odds == 0 {
        state = scr_boss1_laser_state
    }
    else if odds == 1 {
        state = scr_boss1_shoot_state
    }
    else {
        state = scr_boss1_wait_state
    }
}
