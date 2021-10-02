import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String infoResultado = '';

  void multiplicar(){
    setState((){
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double resultado = n1 * n2;

      infoResultado = 'Resultado: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplicador de números'),
        centerTitle: true,
        backgroundColor:Colors.green.shade900,
      ),
      backgroundColor: Colors.brown.shade400,
      body: _body(),
    );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _inputNumero(n1Controller,'Digite o 1º numero'),
          _inputNumero(n2Controller,'Digite o 2º numero'),
          _padding(),
          _outputNumero(),
        ],
      ),
    );
  }

  _inputNumero(variavel,texto){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText:texto,
        labelStyle: _labelStyle(),
      ),
      textAlign: TextAlign.center,
      style: _textStyle(),
      controller: variavel,
    );
  }
  
  _outputNumero(){
    return Text(
    infoResultado,
    style: _textStyle(),
    textAlign: TextAlign.center,
    );
  }

  _labelStyle(){
    return TextStyle(
      color: Colors.green.shade900);
  }

  _textStyle(){
    return TextStyle(color: Colors.white, 
                    fontSize: 25);
  }

  _padding(){
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        height:35,
        child: _button(),
      )
      );
  }

  _button(){
    return RaisedButton(
      onPressed: multiplicar,
      child: Text('Multiplicar',
      style: _textStyle(),
      ),
      color: Colors.green.shade900,
    );
  }
}