import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool dia = true, pequeno = true;

  _salvar() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("dia",dia);
    await prefs.setBool("pequeno",pequeno);
    print('salvou o dia');
  }

  _recuperarInfo() async{
    final prefs = await SharedPreferences.getInstance();
    setState((){
      if(prefs.getBool("dia")!=null){
        dia = prefs.getBool("dia")!;
      }
      if(prefs.getBool("pequeno")!=null){
        pequeno = prefs.getBool("pequeno")!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _recuperarInfo();
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _appbar(){
    return AppBar(
      title: Text('Frases'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }

  _body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Dia'),
            _switchDia(),
            Text('Pequeno'),
            _switchLetra(),
          ]
        ),
        Container(
          child: _text(),
          color: _checkDia(),
          height: 400,
          width: 400,
        ),
      ],
    );
  }

  _switchDia(){
    return Switch(
      value: dia,
      onChanged: (value){
        setState((){
          dia=value;
          _salvar();
        });
      },
      activeColor: Colors.yellowAccent,
    );
  }

  _switchLetra(){
    return Switch(
      value: pequeno,
      onChanged: (value){
        setState((){
          pequeno=value;
          _salvar();
        });
      },
      activeColor: Colors.yellowAccent,
    );
  }

  _text(){
    return Text('\" A vingança nunca é plena, mata a alma e envenena\" (Seu Madruga) ',
    style: TextStyle(
      fontSize: _checkPequeno(),
    ),

    );
  }

  _checkDia(){
    if(dia==true){
      return Colors.white;
    }
    else if(dia==false){
      return Colors.grey;
    }
  }

  _checkPequeno(){
    if(pequeno==true){
      return 12;
    }
    else if(pequeno==false){
      return 36;
    }
  }
}