import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cep/cep.dart';
import 'package:http/http.dart' as http;
import 'package:lista_clientes/utils/cliente.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({ Key? key }) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  late String nome, cpf, telefone, email, cep, endereco, bairro, cidade, estado, complemento;
  String _urlBase = 'http://10.0.2.2:8000';
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerTelefone = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerCep = TextEditingController();
  TextEditingController _controllerEndereco = TextEditingController();
  TextEditingController _controllerBairro = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  TextEditingController _controllerComplemento = TextEditingController();
  
  _post() async {
    var corpo = json.encode(
      {
        "nome": _controllerNome.text,
        "cpf": _controllerCpf.text,
        "telefone": _controllerTelefone.text,
        "email": _controllerEmail.text,
        "cep": _controllerCep.text,
        "logradouro": _controllerEndereco.text,
        "complemento": _controllerComplemento.text,
        "bairro": _controllerBairro.text,
        "localidade": _controllerCidade.text,
        "uf": _controllerEstado.text,
      },
    );
    http.Response response = await http.post(
     Uri.parse(_urlBase + "/POST/clientes/"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );
  }
  _form(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Nome Completo',
          ),
          onSaved: (val){
            nome = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerNome,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'CPF',
          ),
          onSaved: (val){
            cpf = val!;
          },
          keyboardType: TextInputType.number,
          controller: _controllerCpf,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Telefone',
          ),
          onSaved: (val){
            telefone = val!;
          },
          keyboardType: TextInputType.phone,
          controller: _controllerTelefone,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'E-mail',
          ),
          onSaved: (val){
            email = val!;
          },
          keyboardType: TextInputType.emailAddress,
          controller: _controllerEmail,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          onEditingComplete: _cep,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Cep',
          ),
          onSaved: (val){
            cep = val!;
          },
          keyboardType: TextInputType.number,
          controller: _controllerCep,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          onTap: (){
            if(_controllerEndereco.text == '' && _controllerCep.text != ''){
              _cep();
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Endereço',
          ),
          onSaved: (val){
            endereco = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerEndereco,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          onTap: (){
            if(_controllerEndereco.text == '' && _controllerCep.text != ''){
              _cep();
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Bairro',
          ),
          onSaved: (val){
            bairro = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerBairro,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          onTap: (){
            if(_controllerEndereco.text == '' && _controllerCep.text != ''){
              _cep();
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Cidade',
          ),
          onSaved: (val){
            cidade = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerCidade,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          onTap: (){
            if(_controllerEndereco.text == '' && _controllerCep.text != ''){
              _cep();
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Estado',
          ),
          onSaved: (val){
            estado = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerEstado,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Complemento',
          ),
          onSaved: (val){
            complemento = val!;
          },
          keyboardType: TextInputType.text,
          controller: _controllerComplemento,
          validator: (value){
            if(value!.isEmpty){
              return 'Campo Obrigatório';
            }
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(
                      Colors.blue)),
          child: Text(
            'Salvar',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                fontSize: 20),
          ),
          onPressed: _salvar
        ),
      ],
    );
  }
  
  void _cep() async {
  var _cep = _controllerCep.text;
  var resultado = await Cep.consultarCep(_cep);

  var _endereco = resultado.logradouro;
  var _bairro = resultado.bairro;
  var _cidade = resultado.cidade;
  var _uf = resultado.uf;

    _controllerEndereco.text = _endereco;
    _controllerBairro.text = _bairro;
    _controllerCidade.text = _cidade;
    _controllerEstado.text = _uf;
  }
  
_infoSave(){
  return showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Icon(Icons.task_alt),
      content: Text('DADOS SALVOS COM SUCESSO !!!'),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.popAndPushNamed(context, "/");
          }, 
          child: Text('Ok')
        )
      ],
    )
  );
}

  _salvar() async {
    if(_formKey.currentState!.validate()){
      _infoSave();
    }
    _post();  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: _form(),
          ),
        ),
      )
    );
  }
}