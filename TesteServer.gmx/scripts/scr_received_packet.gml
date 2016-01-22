/// scr_received_packet(buffer,socket)

var buffer = argument[0];
var message_id = buffer_read(buffer,buffer_u8);
var socketid = 0;

switch(message_id){
    case 1:
        mx = buffer_read(buffer,buffer_u32);
        my = buffer_read(buffer,buffer_u32);
        instance_create(mx,my,obj_click);
        buffer_seek(buffer,buffer_seek_start,0);
        buffer_write(buffer,buffer_u8,1);
        buffer_write(buffer,buffer_u32,mx);
        buffer_write(buffer,buffer_u32,my);
        for(i = 0; i < ds_list_size(global.socketList);i++){
            socketid = ds_list_find_value(global.socketList,i);
            network_send_packet(socketid,buffer,buffer_tell(buffer));
        }
        break;
}

