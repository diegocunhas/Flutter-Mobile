import 'dart:io';

void main(){
  var Bergameschi = [];
  Bergameschi.add(1);
  Bergameschi.add(1);
  Bergameschi.add(1);

  for(int i=0;i<=19;i++){
    int berg = Bergameschi[i]+Bergameschi[i+1]+Bergameschi[i+2];
    Bergameschi.add(berg);
    print('${Bergameschi[i]}');
  }

}