import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app20_app_de_filmes/filmestable.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<dynamic> filmes = List.empty();

  _recuperarFilme() async{
    String url = 'https://sujeitoprogramador.com/r-api/?api=filmes';

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = json.decode(response.body);

    //print(retorno);
    //print(retorno[0]);
    //print(retorno[1]);
    print(retorno[2]);
    Map<String,dynamic> teste = retorno[3];
    //print(teste['nome']);

    //String teste = retorno[3];
    setState((){
      filmes = retorno;
      print(filmes.length);
    });
  }
  
  @override
  void initState() {
    _recuperarFilme();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(context),
      
    );
  }

  _appBar(){
    return AppBar(
      title: Text('App de Filmes'),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }

  _body(BuildContext context){
    return Center(
      child: ListView(
        children: [
          _card(0),
          _card(1),
          _card(2),
          _card(3),
          _card(4),
          _card(5),
          _card(6),
        ],
      ),  
    );
  }

  _card(pos){
    return Column(
      children: [
        Row(
          children: [
            Text('${filmes[pos]['nome']}'),
            VerticalDivider(color: Colors.grey, width: 200),
            _button(context,pos),
          ]
        ),
      Image.network('${filmes[pos]['foto']}'),
      ],
    );  
  }

  _leiaMais(BuildContext context, pos){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context){
          return Filmes(valueNome: '${filmes[pos]['nome']}', valueDescricao: '${filmes[pos]['sinopse']}');
        }
      ),
    );
  }

  _button(BuildContext context, pos){
    return RaisedButton(
      onPressed: (){_leiaMais(context,pos);
      },
      child: Text('Leia mais', 
        style: TextStyle(color: Colors.green),
        ),
      color: Colors.white,
    );
  }
}