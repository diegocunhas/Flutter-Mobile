import 'dart:io';

void main(){
  print('Entre com o valor da aceleração m/s2');
  double acel = double.parse(stdin.readLineSync()!);
 
  print('Entre com o valor da velocidade inicial m/s');
  double velo = double.parse(stdin.readLineSync()!);

  print('Entre com o o tempo do percurso em s');
  double tempo = double.parse(stdin.readLineSync()!);

  double velFinal = velo + acel*tempo;

  if(velFinal<=40){
    print('Veículo muito lento');
  }
  else if(velFinal>40 && velFinal<=60){
    print('Velocidade permitida');
  }
  else if(velFinal>60 && velFinal<=80){
    print('Velocidade de cruzeiro');
  }
  else if(velFinal>80 && velFinal<=120){
    print('Veículo rápido');
  }
  else if(velFinal>120){
    print('Veículo muito rápido');
  }
}