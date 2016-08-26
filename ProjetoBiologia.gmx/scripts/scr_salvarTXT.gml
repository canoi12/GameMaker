/// scr_salvarTXT()

var file = file_text_open_write(working_directory + "\" + global.nome + ".txt");

file_text_write_string(file, "Nome: " + global.nome);

file_text_close(file);

file = file_text_open_append(working_directory + "\" + global.nome + ".txt");
file_text_writeln(file);
if(room == rm_agua){
    file_text_write_string(file, "Fase atual: água("+string(global.dificuldade)+")")
}
if(room == rm_glicose){
    file_text_write_string(file, "Fase atual: glicose("+string(global.dificuldade)+")")
}
if(room == rm_cannabis){
    file_text_write_string(file, "Fase atual: cannabis("+string(global.dificuldade)+")")
}
file_text_writeln(file);

for(var i = 0; i < 6; i++){
    file_text_write_string(file, "Erros na questao " + string(i+1) + ": " + string(global.errosQuestao[i]));
    file_text_writeln(file);
}

file_text_close(file);
