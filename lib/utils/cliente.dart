import 'package:flutter/cupertino.dart';

class Cliente{
  late String nome;
  late int cpf;
  late int telefone;
  late String email;
  late int cep;
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
      cpf: int.parse(json['cpf']),
      telefone: int.parse(json['telefone']),
      email: json['email'],
      cep: int.parse(json['cep']),
      endereco: json['endereco'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      estado: json['estado'],
      complemento: json['complemento']
    ); 
  }
}