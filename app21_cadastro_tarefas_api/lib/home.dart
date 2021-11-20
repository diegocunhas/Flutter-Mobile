import 'package:flutter/material.dart';
import 'package:app21_cadastro_tarefas_api/Tarefa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //variaveis de controle
  TextEditingController _tituloController = new TextEditingController();
  TextEditingController _descricaoController = new TextEditingController();

  List<Tarefa> _tarefas = List<Tarefa>();

  _exibirTelaCadastro({Tarefa tarefa}){
    String textoSalvarAtualizar = "";
    if(tarefa==null){
      //salvar
      _tituloController.text ="";
      _descricaoController.text ="";
      textoSalvarAtualizar ="Salvar";
    }
    else{
      //atualizar
      _tituloController.text =tarefa.title;
      _descricaoController.text = tarefa.description;
      textoSalvarAtualizar ="Atualizar";
    }

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("$textoSalvarAtualizar Tarefa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _tituloController,
                autofocus: true,
                decoration: InputDecoration(labelText: "Titulo", hintText: "Digite o titulo"),
              ),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: "Descrição", hintText: "Digite a descrição"),
              ),
            ]
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: (){
                _salvarAtualizarTarefa(tarefaSelecionada: tarefa);
                Navigator.pop(context);
              },
              child: Text(textoSalvarAtualizar)
            ),
          ]
        );
      }
    );
  }

  _recuperarTarefas() async {
    String url = 'https://tarefa-backend.herokuapp.com/tasks/';
    http.Response response = await http.get(Uri.parse(url)); 
    print(response);
    var dadosJson = json.decode(response.body);
    List<Tarefa> tarefas = List();

    for(var tarefa in dadosJson){
      print("tarefa: " +tarefa["title"]);
      Tarefa t = Tarefa(tarefa["id"], tarefa["title"], tarefa["description"]);
      tarefas.add(t);
    }
    setState((){
      _tarefas = tarefas;
    });
  }

  _salvarAtualizarTarefa({Tarefa tarefaSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if(tarefaSelecionada == null){
      Tarefa tarefa = Tarefa(null,titulo,descricao);
      await _inserirTarefa(tarefa);
    }
    else{
      tarefaSelecionada.title = titulo;
      tarefaSelecionada.description = descricao;
      await _atualizarTarefa(tarefaSelecionada);
    }

    _tituloController.clear();
    _descricaoController.clear();

    await _recuperarTarefas();
  }

  _inserirTarefa(Tarefa tarefa) async{
    String url = 'https://tarefa-backend.herokuapp.com/tasks/';
    
    http.Response response = await http.post(Uri.parse(url), 
      headers:{"Content-type":"application/json;charset=UTF-8"},
      body: json.encode(tarefa.toMap()));

    return response.statusCode;
  }

  _atualizarTarefa(Tarefa tarefa) async {
    String url = 'https://tarefa-backend.herokuapp.com/tasks/${tarefa.id}';
    var corpo = json.encode(tarefa.toMap());
    
    http.Response response = await http.put(Uri.parse(url), 
      headers:{"Content-type":"application/json;charset=UTF-8"},
      body: corpo);
  }

  _removerTarefa(int id) async{
    String url = 'https://tarefa-backend.herokuapp.com/tasks/${id}';
    
    http.Response response = await http.delete(Uri.parse(url));

    await _recuperarTarefas();
  }

  @override
  void initState() {
    super.initState();
    _recuperarTarefas();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(),
      floatingActionButton: _floatingButton(),
    );
  }

  _appBar(){
    return AppBar(
      title: Text('Cadastro de Tarefas utilizando API'),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body(){
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _tarefas.length,
            itemBuilder: (context, index){
              final tarefaBody = _tarefas[index];
              return _card(tarefaBody);
            }
          )
        )
      ]
    );
  }

  _card(tarefaBody){
    return Card(
      child: ListTile(
        title: Text(tarefaBody.title),
        subtitle: Text(tarefaBody.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap:(){
                _exibirTelaCadastro(tarefa: tarefaBody);
              },
              child: Padding(
                padding: EdgeInsets.only(right:15),
                child: Icon(Icons.edit, color: Colors.green),
              ),
            ),
            GestureDetector(
              onTap:(){
                _removerTarefa(tarefaBody.id);
              },
              child: Padding(
                padding: EdgeInsets.only(right:0),
                child: Icon(Icons.remove_circle, color: Colors.red),
              ),
            ),
          ],
        ),
      )
    );
  }

  _floatingButton(){
    return FloatingActionButton(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      child: Icon(Icons.add),
      onPressed: (){
        _exibirTelaCadastro();
      },
    );
  }

}