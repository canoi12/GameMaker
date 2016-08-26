/// scr_ship_launch_state()

if(x > 720 and !instance_exists(obj_fade)){
    instance_create(0,0,obj_fade);
}

if(x > 1440 and room != Jogo and obj_fade.ativar == true){
    room_goto(Jogo);
}
