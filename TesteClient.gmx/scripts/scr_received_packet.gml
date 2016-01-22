/// scr_received_packet(buffer)

var buffer = argument[0];
var message_id = buffer_read(buffer,buffer_u8);

switch(message_id){
    case 1:
        mx = buffer_read(buffer,buffer_u32);
        my = buffer_read(buffer,buffer_u32);
        instance_create(mx,my,obj_click);
        break;
}

