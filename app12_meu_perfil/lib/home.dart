import 'package:flutter/material.dart';
import 'pessoal.dart';
import 'formacao.dart';
import 'experiencia.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final telas = [
    Center(child: Text('Tela Home')),
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: telas[_currentPage],
      drawer: Drawer(
        child: ListView(
          children: [
            _photo(),
            //FlutterLogo(size: 45),
            Text('Diego da Cunha Silva',
            textAlign: TextAlign.center,),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Bem vindo ao meu perfil'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                setState((){
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              title: Text('Pessoal'),
              subtitle: Text('Quem sou e o que gosto'),
              trailing: Icon(Icons.person_search_sharp),
              onTap: (){
                setState((){
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              title: Text('Formação'),
              subtitle: Text('Meus estudos e cursos'),
              trailing: Icon(Icons.bookmark_outline),
              onTap: (){
                setState((){
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              title: Text('Experiencia'),
              subtitle: Text('Meus projetos'),
              trailing: Icon(Icons.downloading_rounded),
              onTap: (){
                setState((){
                  _currentPage = 3;
                });
              },
            ),
          ]
        ),
      ),
    );
  }

  _appBar(){
    return AppBar(
      title: Text('Meu Perfil'),
      centerTitle: true,
      backgroundColor: Colors.brown.shade600,
    );
  }

  _photo(){
    return Image.asset("assets/images/foto2.jpg",
    fit: BoxFit.contain,
    height: 250,
    width: 250,
    );
  }

}