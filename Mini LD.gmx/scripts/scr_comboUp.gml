/// scr_comboUp()
global.nivelCombo = 1
pecombo = part_emitter_create(pscombo);
part_emitter_region(argument0,pecombo,x,x,y,y,ps_shape_ellipse,ps_distr_linear);
part_emitter_burst(argument0,pecombo,argument1,20);
part_emitter_destroy(argument0,pecombo);
