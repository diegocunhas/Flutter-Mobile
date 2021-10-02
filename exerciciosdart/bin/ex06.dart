import 'dart:io';

void main(){
  print('Entre com o valor da base');
  double base = double.parse(stdin.readLineSync()!);
 
  print('Entre com o valor da altura');
  double altura = double.parse(stdin.readLineSync()!);

  if(base*altura>100){
    print('Terreno grande');
  }
  else{
    print('Terreno pequeno');
  }

}