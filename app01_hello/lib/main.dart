import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home:  _home()   
    );
  }
}

_home() {
  return Scaffold(
        appBar: AppBar(
          title: Text('Hello Diego Cunha'),
        ),
        body: Container(
          color: Colors.brown.shade400
        ),
        drawer: Container(
          color: Colors.brown.shade100
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},),
      );
}