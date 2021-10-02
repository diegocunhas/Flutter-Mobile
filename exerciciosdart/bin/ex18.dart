import 'dart:io';

void main(){
  var listaValores = [];
  
  for(int i=0;i<20;i++){
    print('Entre com o ${i+1}º valor');
    var valor = double.parse(stdin.readLineSync()!);
    listaValores.add(valor);
  }

  print('Entre com um valor para multiplicar os valores da lista');
  var mult = double.parse(stdin.readLineSync()!);


  for(int i=0;i<20;i++){
    listaValores[i] = listaValores[i]*mult;
    print('${listaValores[i]}');
  }

}