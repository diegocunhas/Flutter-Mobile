import 'dart:io';

void main(){
  List ladosTriangulo = [];
  for(int i=1;i<=3;i++){
    print('Entre com o ${i}º lado do triangulo');
    double lado = double.parse(stdin.readLineSync()!);
    ladosTriangulo.add(lado);
  }

  if(ladosTriangulo[0]>ladosTriangulo[1]+ladosTriangulo[2] ||
     ladosTriangulo[1]>ladosTriangulo[0]+ladosTriangulo[2] ||
     ladosTriangulo[2]>ladosTriangulo[0]+ladosTriangulo[1]){
    print('Isto não é um triangulo');
  }
  else if(ladosTriangulo[0]==ladosTriangulo[1] &&
     ladosTriangulo[0]==ladosTriangulo[2]){
    print('Triangulo equilatero');
  }
  else if(ladosTriangulo[0]==ladosTriangulo[1]||
     ladosTriangulo[0]==ladosTriangulo[2] ||
     ladosTriangulo[1]==ladosTriangulo[2]){
    print('Triangulo isosceles');
  }
  else{
    print('triangulo escaleno');
  }

}