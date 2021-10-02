import 'dart:io';

void main(){
  var Sequencia = [];
  Sequencia.add(2);
  print('Entre quantos valores da sequencia deseja exibir');
  int N = int.parse(stdin.readLineSync()!);

  for(int i=0;i<=N;i++){
    int soma = Sequencia[i]+3+2*(i);
    Sequencia.add(soma);
    print('${Sequencia[i]}');
  }

}