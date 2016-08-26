/// scr_tiroDaNave(piloto,objeto)
// Faz a nave atirar
if(argument0 == 0){
    if global.nivelCombo == 0 {
        bala = instance_create(x+16,y+8,obj_bala);
        bala.sprite_index = spr_bala_p1;
        bala.direction = 0;
    } else if global.nivelCombo >= 1 {
        bala = instance_create(x+16,y+4,obj_bala);
        bala.sprite_index = spr_bala_p1b;
        bala.direction = 0;
        bala = instance_create(x+16,y+12,obj_bala);
        bala.sprite_index = spr_bala_p1b;
        bala.direction = 0;
    }
} 
else if(argument0 == 1){
    capanga1.atirar = true;
    capanga2.atirar = true;
} 
else if(argument0 == 2){
    if global.nivelCombo == 0 {
        bala = instance_create(x+16,y+8,obj_bala);
        bala.sprite_index = spr_bala_p2;
        bala.direction = 0;
    } else if global.nivelCombo >= 1 {
        bala = instance_create(x+16,y,obj_bala);
        bala.sprite_index = spr_bala_p2b;
        bala.direction = 0;
        bala = instance_create(x+16,y+12,obj_bala);
        bala.sprite_index = spr_bala_p2a;
        bala.direction = 0;
        bala = instance_create(x+16,y+24,obj_bala);
        bala.sprite_index = spr_bala_p2b;
        bala.direction = 0;
    }
}

timer = qtdBalas;
