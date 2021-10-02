import 'dart:io';

void main(){
  var info = Map<String, int>();
  
  for(int i=0;i<5;i++){
    print('Entre com o ${i+1}º nome');
    String nome = stdin.readLineSync()!;
    print('Entre com a idade de ${nome}');
    int idade = int.parse(stdin.readLineSync()!);

    info[nome] = idade;
  }

  
    print('${info}');
  

}