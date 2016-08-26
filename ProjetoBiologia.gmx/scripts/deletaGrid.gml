///deletaGrid(i,j,tipo)

var i = argument0;
var j = argument1;
var tipo = argument2;

if(global.map[# j, i] == noone)
{
    return -1;
}
else{
    if(global.map[# j, i].image_index == tipo and (global.map[#j,i].stable))
    {
        //if(global.map[#j,i].off){
            global.map[# j, i].alarm[1] = 5;
            global.map[# j, i] = noone;
        //}
        addNew();
        
        if j < 4 then deletaGrid(i,j+1,tipo);
        if i < 7 then deletaGrid(i+1,j,tipo);
        if j > 0 then deletaGrid(i,j-1,tipo);
        if i > 0 then deletaGrid(i-1,j,tipo);
    }
}

