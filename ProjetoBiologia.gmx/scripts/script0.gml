/// script0()

randomize();
global.map = ds_grid_create(5,7);
for(i=0;i<7;i++)
{
    for(j=0;j<5;j++)
    {
        mol = instance_create(Xs+(81*j),Ys+(87*i),obj_Moleculas);
        mol.j = j;
        mol.i = i;
        ds_grid_add(global.map,j,i,mol);
    }
}
