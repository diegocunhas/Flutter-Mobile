import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController altController = new TextEditingController();
  TextEditingController pesController = new TextEditingController();
  String resultado = '';

  void _imc(){
    setState(() {
      double altura = double.parse(altController.text);
      double peso = double.parse(pesController.text);
      double imc = peso/(altura*altura);

      if(imc<=18.5){
        resultado = 'Cuidado você está abaixo do peso';
      }
      else if(imc>18.5 && imc<=24.9){
        resultado = 'Peso Normal, Parabens!!';
      }
      else if(imc>25 && imc<=29.9){
        resultado = 'Atenção - Sobrepeso';
      }
      else if(imc>30 && imc<=34.9){
        resultado = 'Alerta - Obesidade Grau I';
      }
      else if(imc>35 && imc<=39.9){
        resultado = 'Alerta!!! - Obesidade Grau II';
      }
      else{
        resultado='Obesidade Mórbida!!!';
      }
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
      title: Text('IMC'),
      centerTitle: true,
      backgroundColor: Colors.blue.shade200,
      );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network('https://viverbem.unimedbh.com.br/wp-content/uploads/2021/06/imc-900x450.png'),
        _input('a sua altura',altController),
        _input('o seu peso',pesController),
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
        labelText: 'Entre com $texto',
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
      child: Text('Calcule meu IMC',
      style: _styleBlue()
      ),
      color: Colors.yellow.shade100,  
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

  _styleBlue(){
    return TextStyle(
      color: Colors.blue.shade700,
    );
  }

  _styleRed(){
    return TextStyle(
      color: Colors.red,
    );
  }

}