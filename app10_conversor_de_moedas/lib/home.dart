import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorController = new TextEditingController();

  final List<String> moedas = <String>['Real','Dolar','Euro']; 
  String moedaBase = 'Real', moedaConverte='Euro';
  double resultado = 0, valor=0;

  _converter(){
    setState(() {
      valor = double.parse(valorController.text);
    });
    if(moedaBase=='Real'){
      if(moedaConverte=='Real'){
        resultado = valor;
      }
      else if(moedaConverte=='Dolar'){
        resultado = valor/5.47895;
      }
      else if(moedaConverte=='Euro'){
        resultado = valor/6.35340;
      }
    }
    else if(moedaBase=='Dolar'){
      if(moedaConverte=='Dolar'){
        resultado = valor;
      }
      else if(moedaConverte=='Euro'){
        resultado = valor/1.15961;
      }
      else if(moedaConverte=='Real'){
        resultado = valor*5.47895;
      }
    }
    else if(moedaBase=='Euro'){
      if(moedaConverte=='Euro'){
        resultado = valor;
      }
      else if(moedaConverte=='Dolar'){
        resultado = valor*1.15961;
      }
      else if(moedaConverte=='Real'){
        resultado = valor*6.35340;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Conversor de moedas Dolar, Real e Euro'),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
    );
  }

  _body(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _input(),
          Text('Converta: '),
          _dropDownBase(),
          Text('Para: '),
          _dropDownConverte(),
          _button(),
          _resultado(),
        ],
      ),
    );
  }

  _input(){
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: 'Valor',
        labelStyle: TextStyle(color: Colors.blue),
      ),
      style: TextStyle(color: Colors.blue.shade400),
      controller: valorController,
    );
  }

  _dropDownBase(){
    return DropdownButton<String>(
      value: moedaBase,
      items: moedas.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? moedaEscolhida){
        setState((){
          moedaBase=moedaEscolhida!;
        });
      }
    );
  }

  _dropDownConverte(){
    return DropdownButton<String>(
      value: moedaConverte,
      items: moedas.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? moedaEscolhida){
        setState((){
          moedaConverte=moedaEscolhida!;
        });
      }
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _converter,
      child: Text('Converter'),
      color: Colors.amber,
    );
  }

  _resultado(){
    return Text('R\$ $resultado',
    style: TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.greenAccent.shade400,
      ),
    );
  }

}