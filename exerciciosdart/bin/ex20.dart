import 'dart:io';

void main(){
  var info = Map<String, Map<String, int>>();
  
  for(int i=0;i<5;i++){
    print('Entre com o ${i+1}º nome');
    String nome = stdin.readLineSync()!;
    print('Entre com o sexo de ${nome} (F/M)');
    String sexo = stdin.readLineSync()!;
    print('Entre com a idade de ${nome}');
    int idade = int.parse(stdin.readLineSync()!);

    //info[nome] = [sexo, idade],idade;
  }

  
    print('${info}');
  

}