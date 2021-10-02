import 'dart:io';

void main(){
  print('Entre com um valor inteiro');
  int base = int.parse(stdin.readLineSync()!);
 
  for(int i=1;i<=10;i++){
    print('${base} x ${i} = ${i*base}');
  }

}