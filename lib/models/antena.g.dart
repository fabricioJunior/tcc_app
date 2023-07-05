// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'antena.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Antena _$AntenaFromJson(Map<String, dynamic> json) => Antena(
      id: json['id'] as int,
      alcance: $enumDecode(_$AlcanceDaAntenaEnumMap, json['alcance']),
      frequencia: (json['frequencia'] as num).toDouble(),
      nome: json['nome'] as String,
      polarizacao: $enumDecode(_$PolarizacaoEnumMap, json['polarizacao']),
      fixa: json['fixa'] as bool,
    );

Map<String, dynamic> _$AntenaToJson(Antena instance) => <String, dynamic>{
      'id': instance.id,
      'alcance': _$AlcanceDaAntenaEnumMap[instance.alcance]!,
      'frequencia': instance.frequencia,
      'nome': instance.nome,
      'polarizacao': _$PolarizacaoEnumMap[instance.polarizacao]!,
      'fixa': instance.fixa,
    };

const _$AlcanceDaAntenaEnumMap = {
  AlcanceDaAntena.curto: 'curto',
  AlcanceDaAntena.longo: 'longo',
};

const _$PolarizacaoEnumMap = {
  Polarizacao.linear: 'linear',
  Polarizacao.circular: 'circular',
};
