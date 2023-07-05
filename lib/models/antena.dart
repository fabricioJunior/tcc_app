import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'antena.g.dart';

@JsonSerializable()
class Antena extends Equatable {
  final int id;
  final AlcanceDaAntena alcance;
  final double frequencia;
  final String nome;
  final Polarizacao polarizacao;
  final bool fixa;

  const Antena({
    required this.id,
    required this.alcance,
    required this.frequencia,
    required this.nome,
    required this.polarizacao,
    required this.fixa,
  });

  factory Antena.fromJson(Map<String, dynamic> json) => _$AntenaFromJson(json);

  Map<String, dynamic> toJson() => _$AntenaToJson(this);

  Antena copyWith({
    int? id,
    AlcanceDaAntena? alcance,
    double? frequencia,
    ValueGetter<String?>? iso,
    String? nome,
    Polarizacao? polarizacao,
    bool? fixa,
  }) {
    return Antena(
      id: id ?? this.id,
      alcance: alcance ?? this.alcance,
      frequencia: frequencia ?? this.frequencia,
      nome: nome ?? this.nome,
      polarizacao: polarizacao ?? this.polarizacao,
      fixa: fixa ?? this.fixa,
    );
  }

  @override
  List<Object?> get props => [
        id,
        alcance,
        frequencia,
        nome,
        polarizacao,
        fixa,
      ];

  @override
  bool? get stringify => true;
}

enum AlcanceDaAntena {
  curto('Curto Alcance'),
  longo('Longo Alcance');

  final String nome;

  const AlcanceDaAntena(this.nome);
}

enum Polarizacao {
  linear('Polarização linear'),
  circular('Polarização circular');

  final String nome;

  const Polarizacao(this.nome);
}
