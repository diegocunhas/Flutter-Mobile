import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      title: Text('Vagas'),
      centerTitle: true,
      backgroundColor: Colors.grey.shade600,
    );
  }

  _body(){
    return ListView(
      children: <Widget>[
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
        Divider(color: Colors.grey.shade600),
        _anuncio('Vaga teste','1200','experiencia','123@teste'),
        Divider(color: Colors.grey.shade600),
        _anuncio('vaga teste 2','2000','2 anos de experiencia','345@teste.com'),
      ],
    );
  }

  _anuncio(String titulo,valor,String detalhesVaga,String email){
    return Container(
      child: Column(
        children: <Widget>[
          _cabecalho(titulo),
          _salario(valor),
          _descricao(detalhesVaga),
          _contato(email),
        ],
      ),
      color: Colors.blue.shade100,
    );
  }

  _cabecalho(String titulo){
    return Text(titulo,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
    textAlign: TextAlign.center,
    );
  }

  _salario(valor){
    return Text('Salário: R\$ $valor,00',
    style: TextStyle(
      color: Colors.redAccent.shade700,
      ),
    textAlign: TextAlign.left,
    );
  }

  _descricao(String detalhesVaga){
    return Text('Descrição: $detalhesVaga',
    style: TextStyle(
      color: Colors.black,
      ),
    textAlign: TextAlign.left,
    );
  }

  _contato(String email){
    return Text('email para contato: $email',
    style: TextStyle(
      color: Colors.purple.shade900,
      ),
    textAlign: TextAlign.center,
    );
  }

}