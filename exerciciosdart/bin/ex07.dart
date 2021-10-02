import 'dart:io';

void main(){
  print('Entre com o valor do peso em kg');
  double peso = double.parse(stdin.readLineSync()!);
 
  print('Entre com o valor da altura em cm');
  double altura = double.parse(stdin.readLineSync()!)/100;

  if(peso/(altura*altura)>24.9){
    print('você está acima do peso');
  }
  else if(peso/(altura*altura)<18.5){
    print('você está abaixo do peso');
  }
  else{
    print('você possui o peso adequado');
  }

}