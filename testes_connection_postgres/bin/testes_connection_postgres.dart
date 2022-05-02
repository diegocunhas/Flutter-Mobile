import 'package:testes_connection_postgres/testes_connection_postgres.dart' as testes_connection_postgres;
import 'package:postgres/postgres.dart';

void main(List<String> arguments) async{
    final connection = PostgreSQLConnection(
      "ec2-44-196-8-220.compute-1.amazonaws.com", 5432, "d5u41h9ficmo7e",
      username: "ffvkynvtaqjhow",
      password:
          "e7f906db811665563f28752ac1dd625b0366669f9474a6a832768ecc32738a3f",
      useSSL: true);
    await connection.open();

    print("Conectou");

/*     await connection.query('''
    CREATE TABLE acessoPeloApp(
      id serial PRIMARY KEY UNIQUE not null,
      relatorio text
    )
    '''); */
// --------------------------------------------------------------------------------------------------------------------------------
  // CREATE

  // await connection.query("INSERT INTO acessopeloapp(relatorio,analise) VALUES ('teste1','analise1')");
  //await connection.query("INSERT INTO acessopeloapp(relatorio) VALUES ('teste 0.5')");
// --------------------------------------------------------------------------------------------------------------------------------  
  // UPDATE

  // await connection.query("UPDATE acessopeloapp SET analise=@an WHERE id=1",
  // substitutionValues: {'an':'saiu o null'});
// --------------------------------------------------------------------------------------------------------------------------------
  //DELETE
  
  await connection.query("DELETE FROM acessopeloapp WHERE id=@id",
  substitutionValues: {'id':3});

// --------------------------------------------------------------------------------------------------------------------------------  
  // READ

  var results = await connection.query('SELECT * from acessoPeloApp');
  // print(results);
  for (var row in results) {
    print('''
      ===
      id: ${row[0]}
      relatorio: ${row[1]}
      analise: ${row[2]}
      ===
      ''');
  }


  await connection.close();

}