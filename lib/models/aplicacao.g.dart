// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aplicacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aplicacao _$AplicacaoFromJson(Map<String, dynamic> json) => Aplicacao(
      json['nome'] as String,
      json['descricao'] as String,
      (json['referencias'] as List<dynamic>)
          .map((e) => Referencia.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['antenasId'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AplicacaoToJson(Aplicacao instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'referencias': instance.referencias,
      'antenasId': instance.antenasId,
    };
