import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variaveis globais
  TextEditingController cepController = new TextEditingController();
  String info_endereco = '';

  //metodos
  _recuperarCep() async{
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      info_endereco = 'Logradouro: $logradouro \n Bairro: $bairro \n Localidade: $localidade \n Estado: $uf';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      
    );

  }

  _appBar(){
    return AppBar(
      title: Text("Consultar Cep")
    );
  }

  _body(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite o CEP",
              labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize:25.0 ),
              controller: cepController,
          ),
          Padding(
            padding: EdgeInsets.only(top:20.0, bottom:20.0 ),
            child: Container(
              height: 50.0,
              child: _button()
              )
            ),
          Text(info_endereco),
        ]
      )
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _recuperarCep,
      child: Text("Obter endereço", style: TextStyle(color: Colors.white, fontSize:20.0)),
      color: Colors.blue
    );
  }

}