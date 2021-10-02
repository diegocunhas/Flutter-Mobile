import 'dart:io';

void main(){
  var listaValores = [];
  
  for(int i=0;i<10;i++){
    print('Entre com o ${i+1}º valor');
    var valor = double.parse(stdin.readLineSync()!);
    listaValores.add(valor);
  }

  double maiorValor = listaValores[0];

  for(int i=1;i<10;i++){
    if(maiorValor<listaValores[i]){
      maiorValor = listaValores[i];
    }
  }

  print('O maior valor digitado foi ${maiorValor}');
}