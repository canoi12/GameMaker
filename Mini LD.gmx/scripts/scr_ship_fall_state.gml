/// scr_ship_fall_state()

// Se o personagem passar sair da tela, o jogo reinicia
// e destroi todas as partículas de explosão visíveis
if(y > room_height){
    global.upgrade = true;
    if instance_exists(obj_Inimigo) then part_emitter_destroy_all(obj_Inimigo.ps);
    if !instance_exists(obj_scoreScreen) then instance_create(0,-400,obj_scoreScreen);
}

part_emitter_destroy(ps,pemitter);
part_emitter_region(ps2,pexplo,x-25,x+25,y,y+6,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_stream(ps2,pexplo,pt2,2);

gravity = 0.7;

if(colisao){
    image_alpha = !image_alpha;
}
