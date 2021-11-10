import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variaveis globais
  TextEditingController gitController = new TextEditingController();
  String info_git = '';
  String fotoGit ='https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png';

  //metodos
  _recuperarGit() async{
    String url = 'https://api.github.com/users/${gitController.text}';
    String nome = '', foto='';

    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> retorno = json.decode(response.body);

    if(retorno["message"]=="Not Found"){
      setState(() {
        info_git= 'Usuário não localizado';
        fotoGit = 'assets/images/notfound.jpg';
      });
    }

    else{
      int id = retorno["id"];
      String foto = retorno["avatar_url"];
      if(retorno["name"]!=null){
        nome = retorno["name"];
      } 
      int repositorios = retorno["public_repos"];
      String criacao = _formatarData(retorno["created_at"]);
      int seguidores = retorno["followers"];
      int seguindo = retorno["following"];

      setState(() {
        info_git= ' id: $id \n Nome: $nome \n Repositorios: $repositorios \n Criado em: $criacao \n Seguidores: $seguidores \n Seguindo: $seguindo';
        fotoGit = foto;
      });

    }

  }

  _formatarData(String data){
    initializeDateFormatting("pt_BR");
    var formatador = DateFormat.yMd("pt-BR");

    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
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
      title: Text("Consultar Git"),
      centerTitle: true,
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
              labelText: "Digite o Login",
              labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize:25.0 ),
              controller: gitController,
          ),
          Padding(
            padding: EdgeInsets.only(top:20.0, bottom:20.0 ),
            child: Container(
              height: 50.0,
              child: _button()
              )
          ),
          Image.network('$fotoGit',
            height: 150.0, width: 150.0),
          Text(info_git),
        ]
      )
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _recuperarGit,
      child: Text("Ver perfil", style: TextStyle(color: Colors.white, fontSize:20.0)),
      color: Colors.blue
    );
  }  

}