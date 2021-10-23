//@dart=2.9
import 'package:flutter/material.dart';
import 'package:lista_clientes/base/screens/home.dart';
import 'package:lista_clientes/base/screens/telaCadastro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var title = "Lista de Clientes";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cadastro': (context) => TelaCadastro(),
      },
    );
  }
}

