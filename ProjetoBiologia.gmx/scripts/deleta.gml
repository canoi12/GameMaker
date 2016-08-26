/// deleta(objeto,tipo)

obj = argument0;
tipo = argument1;


if(obj == noone)
{
    return -1;
}
else{
    if(obj.image_index == tipo){
        
        //obj.alarm[0] = 5;
        //obj.image_index = 1;
        if x < 928 then deleta(instance_position(obj.x+81,obj.y,obj_Moleculas),tipo);
        if y < 642 then deleta(instance_position(obj.x,obj.y+87,obj_Moleculas),tipo);
        /*if x > 604 then deleta(instance_position(obj.x-81,obj.y,obj_Moleculas),tipo);
        if y > 120 then deleta(instance_position(obj.x,obj.y-87,obj_Moleculas),tipo);*/
    }
    else
    {
        return 0;
    }
}

/*
test = instance_position(obj.x+81,obj.y,obj_Moleculas);
if(test != noone and test.image_index == tipo and !test.destroy)
    deleta(test,tipo);
    
test = instance_position(obj.x,obj.y+87,obj_Moleculas);
if(test != noone and test.image_index == tipo and !test.destroy)
    deleta(test,tipo);
    
test = instance_position(obj.x-81,obj.y,obj_Moleculas);
if(test != noone and test.image_index == tipo and !test.destroy)
    deleta(test,tipo);
    
test = instance_position(obj.x,obj.y-87,obj_Moleculas);
if(test != noone and test.image_index == tipo and !test.destroy)
    deleta(test,tipo);*/
