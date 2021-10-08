import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  final int valueIdade;
  final String valueNome, valueSexo, valueEscolaridade;
  final double valueLimite;
  final bool valueNacionalidade;

  const Dados({required this.valueIdade,required this.valueNome,required this.valueSexo,
  required this.valueEscolaridade,required this.valueLimite,required this.valueNacionalidade});
  


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
      title: Text('Dados Informados'),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      );
  }

  _body(){
    return Center(
      //padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _texto('Nome: ',valueNome),
          _texto('Idade: ',valueIdade),
          _texto('Sexo: ',valueSexo),
          _texto('Escolaridade: ',valueEscolaridade),
          _texto('Limite: ',valueLimite),
          _texto('Brasileiro: ',valueNacionalidade),
        ],
      ),
    );
  }

  _texto(String inicio,value){
    return Text('$inicio $value',
      style: TextStyle(
        color: Colors.blueAccent.shade400,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

}