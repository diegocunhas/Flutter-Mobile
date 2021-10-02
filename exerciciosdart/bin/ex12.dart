import 'dart:io';

void main(){
  print('Entre com um valor inteiro');
  int base = int.parse(stdin.readLineSync()!);

  print('Entre com o limite inferior');
  int A = int.parse(stdin.readLineSync()!);

  print('Entre com o limite superior');
  int B = int.parse(stdin.readLineSync()!);

  if(B>A){
    for(int i=A;i<=B;i++){
      print('${base} x ${i} = ${i*base}');
    }
  }
  else{
    print('valores de limite invalidos');
  }

}