import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variaveis globais
  TextEditingController valorController = new TextEditingController();

  final List<String> moedas = <String>['Real','Dolar','Euro','BitCoin']; 
  String moedaBase = 'Real', moedaConverte='Euro';
  double resultado = 0, valor=0, taxaConversao=0;
  
  //metodos

  _recuperarMoeda(link,map) async {
    String url = 'https://economia.awesomeapi.com.br/last/$link';
    
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> retorno = json.decode(response.body);
    //print(retorno);
    //var teste2 = retorno.keys;
    //print(teste2);
    //double taxaConversao = double.parse(retorno[map]['ask']);
    //print(taxaConversao);
    //return taxaConversao;

    setState(() {
      taxaConversao = double.parse(retorno[map]['ask']);
      print(taxaConversao);
    });
  }

  _converter() async {
    setState(() {
      valor = double.parse(valorController.text);
    });
    if(moedaBase=='Real'){
      if(moedaConverte=='Real'){
        resultado = valor;
      }
      else if(moedaConverte=='Dolar'){
        await _recuperarMoeda("USD-BRL","USDBRL");
        resultado = double.parse((valor/taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='Euro'){
        await _recuperarMoeda("EUR-BRL","EURBRL");
        resultado = double.parse((valor/taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='BitCoin'){
        await _recuperarMoeda("BTC-BRL","BTCBRL");
        resultado = double.parse((valor/(taxaConversao*1000)).toStringAsFixed(2));
      }
    }
    else if(moedaBase=='Dolar'){
      if(moedaConverte=='Dolar'){
        resultado = valor;
      }
      else if(moedaConverte=='Euro'){
        await _recuperarMoeda("USD-EUR","USDEUR");
        resultado = double.parse((valor*taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='Real'){
        await _recuperarMoeda("USD-BRL","USDBRL");
        resultado = double.parse((valor*taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='BitCoin'){
        await _recuperarMoeda("BTC-USD","BTCUSD");
        resultado = double.parse((valor/(taxaConversao*1000)).toStringAsFixed(2));
      }
    }
    else if(moedaBase=='Euro'){
      if(moedaConverte=='Euro'){
        resultado = valor;
      }
      else if(moedaConverte=='Dolar'){
        await _recuperarMoeda("EUR-USD","EURUSD");
        resultado = double.parse((valor*taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='Real'){
        await _recuperarMoeda("EUR-BRL","EURBRL");
        resultado = double.parse((valor*taxaConversao).toStringAsFixed(2));
      }
      else if(moedaConverte=='BitCoin'){
        await _recuperarMoeda("BTC-EUR","BTCEUR");
        resultado = double.parse((valor/(taxaConversao*1000)).toStringAsFixed(2));
      }
    }
    else if(moedaBase=='BitCoin'){
      if(moedaConverte=='BitCoin'){
        resultado = valor;
      }
      else if(moedaConverte=='Real'){
        await _recuperarMoeda("BTC-BRL","BTCBRL");
        resultado = double.parse((valor*(taxaConversao*1000)).toStringAsFixed(2));
      }
      else if(moedaConverte=='Dolar'){
        await _recuperarMoeda("BTC-USD","BTCUSD");
        resultado = double.parse((valor*(taxaConversao*1000)).toStringAsFixed(2));
      }
      else if(moedaConverte=='Euro'){
        await _recuperarMoeda("BTC-EUR","BTCEUR");
        resultado = double.parse((valor*(taxaConversao*1000)).toStringAsFixed(2));
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
    return Text('$resultado',
    style: TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.greenAccent.shade400,
      ),
    );
  }

}