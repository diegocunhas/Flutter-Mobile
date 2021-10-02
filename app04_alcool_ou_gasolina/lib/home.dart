import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController gasController = new TextEditingController();
  TextEditingController alcController = new TextEditingController();
  String resultado = '';

  void _calcular(){
    setState(() {
      double gas = double.parse(gasController.text);
      double alc = double.parse(alcController.text);
      double calc = alc/gas;

      if(calc<=0.7){
        resultado = 'Compensa mais o alcool';
      }
      else{
        resultado='Compensa mais a gasolina';
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
      title: Text('Alcool ou Gasolina?'),
      centerTitle: true,
      backgroundColor: Colors.black38,
      );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network('https://lh3.googleusercontent.com/HwREGS-pFWbW3-CCWerS0XVFv_PKHtQIx0XSCc4RScrJgIvDuiuPzCrnI-hsidLFQh0'),
        _input('da gasolina',gasController),
        _input('do alcool',alcController),
        _button(),
        _output(resultado),
        ],
      ),
    );
  }

  _input(texto,variavel){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Entre com o preço $texto',
        labelStyle: _styleBlack(),
      ),
      textAlign: TextAlign.left,
      style: _styleBlack(),
      controller: variavel,
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _calcular,
      child: Text('Qual compensa mais?',
      style: _styleGreen()
      ),
      color: Colors.black87,  
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

  _styleGreen(){
    return TextStyle(
      color: Colors.green.shade600,
    );
  }

  _styleRed(){
    return TextStyle(
      color: Colors.red,
    );
  }

}