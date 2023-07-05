// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Atividade _$AtividadeFromJson(Map<String, dynamic> json) => Atividade(
      identificador: json['identificador'] as String,
      nome: json['nome'] as String,
      aplicacoes: (json['aplicacoes'] as List<dynamic>)
          .map((e) => Aplicacao.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AtividadeToJson(Atividade instance) => <String, dynamic>{
      'identificador': instance.identificador,
      'nome': instance.nome,
      'aplicacoes': instance.aplicacoes,
    };
