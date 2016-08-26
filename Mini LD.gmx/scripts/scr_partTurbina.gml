/// scr_partTurbina
// Particulas da turbina

// Particulas
ps = part_system_create();
part_system_depth(ps,60);

// Particulas das turbinas
pt = part_type_create();
part_type_shape(pt,pt_shape_circle);
part_type_orientation(pt,15,40,0,0,0);
part_type_size(pt,0.05,0.2,0,0);
part_type_colour_mix(pt,c_purple,c_white)
part_type_speed(pt,2,2.5,0.1,0);
part_type_direction(pt,180,180,0,4);
part_type_life(pt,10,10);

pemitter = part_emitter_create(ps);
part_emitter_region(ps,pemitter,x-25,x-25,y+3,y+3,ps_shape_ellipse,ps_distr_linear);
part_emitter_stream(ps,pemitter,pt,2);
