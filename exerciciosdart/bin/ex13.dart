import 'dart:io';

void main(){
  var Fibonacci = [];
  Fibonacci.add(1);
  Fibonacci.add(1);

  for(int i=0;i<=29;i++){
    int fib = Fibonacci[i]+Fibonacci[i+1];
    Fibonacci.add(fib);
    print('${Fibonacci[i]}');
  }

}