/// scr_boss1_wait_state

timer -= 1;
var odds = irandom_range(0,1)
if(timer <= 0){
    if(odds == 0){
        state = scr_boss1_shoot_state
    }
    else {
        state = scr_boss1_laser_state
    }
}
