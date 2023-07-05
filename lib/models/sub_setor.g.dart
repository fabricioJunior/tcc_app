// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_setor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubSetor _$SubSetorFromJson(Map<String, dynamic> json) => SubSetor(
      identificador: json['identificador'] as String,
      nome: json['nome'] as String,
      atividades: (json['atividades'] as List<dynamic>)
          .map((e) => Atividade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubSetorToJson(SubSetor instance) => <String, dynamic>{
      'identificador': instance.identificador,
      'nome': instance.nome,
      'atividades': instance.atividades,
    };
