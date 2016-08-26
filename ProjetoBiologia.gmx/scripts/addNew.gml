///addNew()

for(var k = 0; k < 5; k++)
{
    if(global.map[#k,0] == noone and place_free(Xs+(81*k),Ys+24)){
        mol = instance_create(Xs+(81*k),Ys,obj_Moleculas);
        mol.j = k;
        mol.i = 0;
        global.map[#k,0] = mol;
    }
}
