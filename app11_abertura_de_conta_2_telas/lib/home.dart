import 'package:flutter/material.dart';
import 'dados.dart';

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
      title: Text('Abertura de Conta'),
      centerTitle: true,
      backgroundColor: Colors.purple.shade800,
      );
  }

  _body(BuildContext context){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        _inputNome('Nome:',nomeController),
        _inputNum('Idade:',idaController),
        Row(
          children: <Widget>[
            _texto('Sexo: ',_styleBlack()),
            _dropDownSex(itemSexo),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          children: <Widget>[
            _texto('Escolaridade: ',_styleBlack()),
            _dropDownEsc(itemEscolar),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          children: <Widget>[
            _texto('Limite:',_styleBlack()),
            _slider(),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          children: <Widget>[
            _texto('Brasileiro:',_styleBlack()),
            _switch(),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        
        _button(context),

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

  _dropDownSex(list){
    return  DropdownButton<String>(
      value: sexoTemp,
      items: list.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado){
        setState((){
          sexoTemp=valorSelecionado!;
        });
      }
    );
  }

  _dropDownEsc(list){
    return  DropdownButton<String>(
      value: escolarTemp,
      items: list.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado){
        setState((){
          escolarTemp=valorSelecionado!;
        });
      }
    );
  }
  
  _slider(){
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: Colors.purple.shade200,
        activeTrackColor: Colors.grey,
        inactiveTrackColor: Colors.grey,
      ),
      child: Slider(
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
    ),
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
      activeTrackColor: Colors.purple.shade100,
      activeColor: Colors.purple.shade200,
    );
  }

  _button(BuildContext context){
    return RaisedButton(
      onPressed: (){ _confirmar(context);
        },
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

  _confirmar(BuildContext context){
    idade = int.parse(idaController.text);
    nome = nomeController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context){
          return Dados(valueIdade: idade,valueNome: nome,valueSexo: sexoTemp,
          valueEscolaridade: escolarTemp,valueLimite: limiteTemp,valueNacionalidade: nacionalidadeTemp,);
        },
      ),
    );
  }

}