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
      title: Text('Anuncios de Vendas'),
      centerTitle: true,
      backgroundColor: Colors.greenAccent.shade400,
    );
  }

  _body(){
    return PageView(
      children: <Widget>[
        _classificados('batatabaroa.jpg','Batata Baroa a melhor para saladas'),
        _classificados('batatadoce.jpg','Batata Doce a melhor para controlar seus carboidratos'),
        _classificados('batatainglesa.png','A tradicional batata da familia brasileira'),
        _classificados('batatayacon.jpg','Não sei o que escrever aqui'),
        _classificados('batataconserva.jpg','Acompanhamento perfeito para um churrasco, batata em conserva é prática e da agua na boca'),
      ]
    );
  }

  _classificados(nomeFoto,descricao){
    return Container(
      child: Column(
        children: <Widget>[
          _foto(nomeFoto),
          _texto(descricao),
        ]
      ),
    );
  }

  _foto(nomeFoto){
    return Image.asset("assets/images/$nomeFoto",
    fit: BoxFit.contain);
  }

  _texto(descricao){
    return Text(descricao,
      style: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.italic,
        //fontSize: 5,
      ),
    );
  }

}