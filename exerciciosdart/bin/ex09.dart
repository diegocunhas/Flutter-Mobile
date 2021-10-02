import 'dart:io';

void main(){
  print('Entre com o seu sexo (M/F)');
  String sexo = stdin.readLineSync()!;

  print('Entre com o valor do peso em kg');
  double peso = double.parse(stdin.readLineSync()!);
 
  print('Entre com o valor da altura em cm');
  double altura = double.parse(stdin.readLineSync()!)/100;

  if(sexo=='M')
  {
    if(peso/(altura*altura)>25){
      print('você está acima do peso');
    }
    else if(peso/(altura*altura)<20){
      print('você está abaixo do peso');
    }
    else{
      print('você possui o peso adequado');
    }
  }
  else if(sexo=='F')
  {
    if(peso/(altura*altura)>24){
      print('você está acima do peso');
    }
    else if(peso/(altura*altura)<19){
      print('você está abaixo do peso');
    }
    else{
      print('você possui o peso adequado');
    }
  }
  

}