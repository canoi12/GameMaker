/// reordGrid()

for(var i = 5; i >= 0; i--)
{
    for(var j = 4;j >= 0; j--)
    {
        if(global.map[#j,i] != noone and global.map[#j,i+1] == noone){
            global.map[#j,i].i++;
            global.map[#j,i+1] = global.map[#j,i];
            global.map[#j,i] = noone;
        }
    }
}
