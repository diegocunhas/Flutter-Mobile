import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  static int cont=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: _home(),
    );
  }
}
_home(){
  return Scaffold(
        appBar: AppBar(
          title: Text('teste'),
          centerTitle: true,
        ),
        body: _body(),
  );
}

_body(){
  return Container(
    color: Colors.brown,
    child: Center(
      child: Column(
        children: [_button(Colors.green,'+'),
                  _button(Colors.red,'-'),],
      ),
    ),
  );
}

_onClick1(){
    MyApp.cont++;
}

_onClick2(){
    MyApp.cont--;
}

_button(coloracao,texto){
  if(texto=='+'){
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(coloracao) ),
        onPressed: _onClick1,
        child: Text(texto),
        );
  }
  else if(texto=='-'){
    return ElevatedButton(
        onPressed: _onClick2,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(coloracao) ),
        child: Text(texto),
        );
        }
  



}
