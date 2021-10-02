import 'dart:io';

void main(){
  print('Entre com o valor da base');
  double base = double.parse(stdin.readLineSync()!);
 
  print('Entre com o valor da altura');
  double altura = double.parse(stdin.readLineSync()!);

  print('A área do retangulo é: ${base*altura}');

}