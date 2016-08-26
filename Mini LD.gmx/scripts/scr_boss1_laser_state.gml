/// scr_boss1_laser_state()

if(laserPosy >= laserPosYfim-5){
    ataque2 = false;
    state = scr_boss1_wait_state;
} else {
    if(ataque2){
        k -= 0.5;
        l -= 0.5;
        if(k <= 0){
            laserPosy = lerp(laserPosy,laserPosYfim,0.2)
            if(l <= 0){
                instance_create(laserPosx, laserPosy,obj_explosion);
                l = 1;
            }
        }
    }
}
