/// gridEmpty()

empty = true;

for(i = 0; i < 7; i++){
    for(j = 0; j < 5; j++){
        if(global.map[# j, i] != noone)
            empty = false;      
    }
}

return empty;
