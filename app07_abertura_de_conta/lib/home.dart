import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nomeController = new TextEditingController();
  TextEditingController idaController = new TextEditingController();
  int idade = 0;
  String nome ='', sexo ='', escolaridade='';
  String sexoTemp ='Feminino';
  List<String> itemSexo = <String>['Masculino','Feminino'];
  String escolarTemp = 'Fundamental Incompleto';
  final List<String> itemEscolar = <String>['Fundamental Incompleto','Fundamental Completo',
                                            'Médio Incompleto','Médio Completo',
                                            'Superior Completo','Superior Incompleto'];
  double limite =0, limiteTemp = 400;
  bool nacionalidadeTemp = true, nacionalidade = false;

  void _confirmar(){
    setState(() {
      idade = int.parse(idaController.text);
      nome = nomeController.text;
      sexo = sexoTemp;
      escolaridade = escolarTemp;
      limite = limiteTemp;
      nacionalidade = nacionalidadeTemp;
    });
  }




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
      title: Text('Abertura de Conta'),
      centerTitle: true,
      backgroundColor: Colors.redAccent.shade400,
      );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        _inputNome('Nome:',nomeController),
        _inputNum('Idade:',idaController),
        _texto('Sexo:',_styleBlack()),
        _dropDownBox(sexoTemp,itemSexo),
        _texto('Escolaridade:',_styleBlack()),
        _dropDownBox(escolarTemp,itemEscolar),
        _texto('Limite:',_styleBlack()),
        _slider(),
        _texto('Brasileiro:',_styleBlack()),
        _switch(),
        _button(),

        Text('Dados Informados',
          style: _styleBlue(),
          textAlign:TextAlign.center,
        ),
        _texto('Nome: $nome',_styleBlue()),
        _texto('Idade: $idade',_styleBlue()),
        _texto('Sexo: $sexo',_styleBlue()),
        _texto('Escolaridade: $escolaridade',_styleBlue()),
        _texto('Limite: $limite',_styleBlue()),
        _texto('Brasileiro: $nacionalidade',_styleBlue()),
        ],
      ),
    );
  }

  _inputNome(texto,objController){
    return TextField(
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _inputNum(texto,objController){
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _dropDownBox(varTemp,list){
    return  DropdownButton<String>(
      value: varTemp,
      items: list.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado){
        setState((){
          varTemp=valorSelecionado!;
        });
      }
    );
  }
  
  _slider(){
    return Slider(
      value: limiteTemp,
      min: 400,
      max: 2400,
      divisions: 50,
      label: limiteTemp.round().toString(),
      onChanged: (double value){
        setState((){
          limiteTemp = value;
        });
      },
    );
  }

  _switch(){
    return Switch(
      value: nacionalidadeTemp,
      onChanged:(value){
        setState((){
          nacionalidadeTemp=value;
        });
      },
      activeTrackColor: Colors.blue.shade900,
      activeColor: Colors.purple.shade200,
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _confirmar,
      child: Text('Confirmar',
      style: _styleBlack()
      ),
      color: Colors.purple.shade200,  
    );
  }

  _texto(param,estilo){
    return Text(param,
    style: estilo,
    textAlign:TextAlign.left,
    );
  }
  

  _styleBlack(){
    return TextStyle(
      color: Colors.black,
    );
  }

  _styleBlue(){
    return TextStyle(
      color: Colors.blue.shade900,
    );
  }

}