import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lista_clientes/utils/cliente.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  get nullableList => null;


List<Cliente> parseCliente(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cliente>((json) => Cliente.fromJson(json)).toList();
}
Future<List<Cliente>> _fetchClientes(http.Client client) async {
  final response = await client.get(Uri.parse('http://10.0.2.2:8000/GET/clientes/'));

  print(response.body.toString());
  return parseCliente(response.body.toString());
}
void _telaCadastro(){
  Navigator.of(context).pushNamed('/cadastro');
}
Widget listaClientes() {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Cliente>>(
            initialData: [],
            future: _fetchClientes(http.Client()),
            builder:(BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
              switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        var count = snapshot.data?.length;
                        return ListView.builder(
                            itemCount:count,
                            itemBuilder: (context, index) {
                              List<Cliente>? lista = snapshot.data;
                              Cliente client = lista![index];                      
                              return ListTile(
                                leading: Icon(Icons.account_circle_rounded),
                                trailing: Icon(Icons.add),
                                title: Text(client.nome),
                                subtitle: Text(client.telefone.toString()),
                                onTap: (){
                                  showDialog(
                                    context: context, 
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                        '${client.nome}\n ${client.cpf}\n ${client.telefone}\n ${client.email}\n ${client.cep}\n ${client.endereco}\n ${client.bairro}\n ${client.cidade}\n ${client.estado}\n ${client.complemento}'
                                      ),
                                    )
                                  );
                                }
                              );
                            });
                      } else {
                          return Center(child: Text('${snapshot.connectionState}'),);
                        //  var count = snapshot.data?.length;
                        // return ListView.builder(
                        //     itemCount:count,
                        //     itemBuilder: (context, index) {
                        //       var client = [];
                        //       List<Cliente>? lista = snapshot.data;
                        //       Cliente post = client[index];
                        //       for (var p in lista!) {
                        //         if(snapshot.data != null && client.length > 0){
                        //           client.add(p);
                        //         } return client[index];
                        //       }                        
                        //       return ListTile(
                        //         title: Text(post.nome),
                        //         subtitle: Text(post.telefone.toString()),
                        //       );
                        //     });
                      }
                      //break;
                  }
                  //return Text('${snapshot.connectionState}');
              
            }
          ),
        )
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: listaClientes(),
      floatingActionButton: FloatingActionButton(
        onPressed: _telaCadastro,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}