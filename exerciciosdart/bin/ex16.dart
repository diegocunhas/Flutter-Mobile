import 'dart:io';

void main(){
  var listaValores = [];
  
  for(int i=0;i<10;i++){
    print('Entre com o ${i+1}º valor');
    var valor = double.parse(stdin.readLineSync()!);
    listaValores.add(valor);
  }
  for(int i=10;i>0;i--){
    print('${listaValores[i-1]}');
  }

}