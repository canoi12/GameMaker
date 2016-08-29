/// scr_ship_move_state()

timer -= 1;

// Atualiza constantemente o x e y das particulas para simularem o fogo da nave
part_emitter_region(ps,pemitter,x-25,x-25,y+3,y+3,ps_shape_ellipse,ps_distr_linear);
part_emitter_stream(ps,pemitter,pt,2);

if(keyboard_check(vk_down)){
    y+= vspd;
    image_index = 2;
}
else if(keyboard_check(vk_up)){
    y -= vspd;
    image_index = 0;
}
else {
    if(jogar){
        image_index = 1;
    }
}
if(keyboard_check(vk_right)){
        x += vspd;
}
else if(keyboard_check(vk_left)){
        x -= vspd;
}
if(os_type == os_android){
    if(device_mouse_check_button(0, mb_left)){
        var yy = device_mouse_y(0);
        if(yy < 100){
            keyboard_key_press(vk_up);
        }
        else if(yy > 300){
            keyboard_key_press(vk_down);
        }
        else
        {
            keyboard_key_press(ord("X")); 
        }
    }
    else{
        keyboard_key_release(vk_up);
        keyboard_key_release(vk_down);
        keyboard_key_release(ord("X"));
    }
    if(device_mouse_check_button(0, mb_left)){
        var xx = device_mouse_x(0);
        if(xx < 160){
            keyboard_key_press(vk_left);
        }
        else if(xx > 560){
            keyboard_key_press(vk_right);
        }
    }
    else{
        keyboard_key_release(vk_left);
        keyboard_key_release(vk_right);
    }
}

//Controles de view's e dos limites da nave na tela
view_xview[0] = 0;
view_yview[0] = 0;
x = min(max(50,x),room_width);
y = min(max(100,y),room_height-50);

// Quando a energia chegar a 0, muda o angulo da nave, e faz ela começar a cair
if(energia <= 0){
    global.pontos = pontosExtras;
    caindo = true;
    state = scr_ship_fall_state
    energia = 0;
    if(image_angle > -45){
        image_angle -= 5;
    }
}

gravity = 0;

if(energia > global.energia){
    energia = global.energia;
}

// Decrementa 1 de energia a cada frame
if (!global.desafios) then energia -= 1;

if(colisao){
    image_alpha = !image_alpha;
}

// Sistema de Distância e Dificuldade
global.km = global.progresso/2;
pontosExtras = global.pontos + ceil(global.km*100); 
pontosExtras += 10*global.combo;
//if global.km > 30 then global.dificuldade = 1;

// Sistema de Combo
if(global.combo > 0){
    global.barraCombo -= 0.5;
}
if(global.barraCombo < 0){
    global.barraCombo = 0;
    global.combo = 0;
}
if(global.barraCombo > 100){
    global.barraCombo = 100;
}
if (global.combo > 0 and global.combo >= (global.nivelCombo+1)*20
    and !instance_exists(obj_comboUp)) {
    global.nivelCombo += 1;
    instance_create(x,y,obj_comboUp);
}

//room == Jogo  and
if(floor(global.progresso) >= (60*global.desafioAtual) and room == Jogo and
   global.progresso < 260) {
    global.desafios = true;
}
if(!global.desafios and room == Jogo){
    global.progresso += global.velPlayer/20;
}

if(global.velPlayer > 1)
{
    image_speed = 1;
}
else 
{
    image_speed = 0;
}
