import 'package:flutter/material.dart';

class Filmes extends StatelessWidget {
  final String valueNome, valueDescricao;

  const Filmes({required this.valueNome, required this.valueDescricao});

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
      title: Text('Sinopse - $valueNome'),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }

  _body(){
    return Container(
      child: Center(
        child: Text('$valueDescricao')
      ),
    );
  }
}