import 'package:flutter/cupertino.dart';

class Cliente{
  late String nome;
  late String cpf;
  late String telefone;
  late String email;
  late String cep;
  late String endereco;
  late String bairro;
  late String cidade;
  late String estado;
  late String complemento;

  Cliente({
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.cep,
    required this.endereco,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.complemento
  });

  factory Cliente.fromJson(Map<String, dynamic> json){
    return Cliente(
      nome: json['nome'],
      cpf: json['cpf'],
      telefone: json['telefone'],
      email: json['email'],
      cep: json['cep'],
      endereco: json['endereco'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      estado: json['estado'],
      complemento: json['complemento']
    ); 
  }
}