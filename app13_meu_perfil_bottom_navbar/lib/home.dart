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
  int _currentIndex = 0;
  final tabs = [
    Center(child: Column(children: [Text('Tela Home')],)),
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown.shade600,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/pessoal.png'),
            label: 'Pessoal',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/formacao.png'),
            label: 'Formação',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/experience.png'),
            label: 'Experiencia',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        }
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

}