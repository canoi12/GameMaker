/// scr_write_text(x, y, text, modo ["textbox" ou vazio])

var txtbox = instance_create(argument[0], argument[1], obj_Text);
txtbox.Texto[0] = argument[2];
txtbox.modo = argument[3];
txtbox.textWidth = 512;

return txtbox;
