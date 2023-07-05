// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referencia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Referencia _$ReferenciaFromJson(Map<String, dynamic> json) => Referencia(
      json['nome'] as String,
      (json['link'] as String?) ?? '',
    );

Map<String, dynamic> _$ReferenciaToJson(Referencia instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'link': instance.link,
    };
