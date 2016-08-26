/// encontraCel(objeto)

for(var i = 0; i < 7; i++)
{
    for(var j = 0; j < 5; j++){
        if(ds_grid_get(global.map,j,i) == objeto)
        {
            return i;
        }
    }
}
