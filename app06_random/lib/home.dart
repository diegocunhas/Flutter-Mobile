import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController numController = new TextEditingController();
  String resultado = '';

  void _imc(){
    setState(() {
      int numeroUsuario = int.parse(numController.text);
      int numeroGerado = new Random().nextInt(10);

      numeroUsuario==numeroGerado ? resultado='Parabéns você acertou - o número era $numeroGerado' : resultado='Xiii você errou - o número era $numeroGerado';

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(),

    );
  }

  _appBar(){
    return AppBar(
      title: Text('Descubra o número (1-10)'),
      centerTitle: true,
      backgroundColor: Colors.purple,
      );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network('https://img.lovepik.com/element/40122/3807.png_1200.png'),
        _input('Entre com um numero de 1 a 10',numController),
        _button(),
        _output(resultado),
        ],
      ),
    );
  }

  _input(texto,variavel){
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: _styleBlack(),
        alignLabelWithHint: true,
      ),
      style: _styleBlack(),
      controller: variavel,
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _imc,
      child: Text('Acertei?',
      style: _styleBlack()
      ),
      color: Colors.purple.shade200,  
    );
  }

  _output(saida){
    return Text(saida,
    style: _styleRed(),
    textAlign:TextAlign.center,
    );
  }

  _styleBlack(){
    return TextStyle(
      color: Colors.black,
    );
  }

  _styleRed(){
    return TextStyle(
      color: Colors.red,
    );
  }

}