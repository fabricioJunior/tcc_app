import 'package:json_annotation/json_annotation.dart';
import 'package:tcc_app/models/atividade.dart';
part 'sub_setor.g.dart';

@JsonSerializable()
class SubSetor {
  SubSetor({
    required this.identificador,
    required this.nome,
    required this.atividades,
  });
  final String identificador;
  final String nome;
  final List<Atividade> atividades;

  factory SubSetor.fromJson(Map<String, dynamic> json) =>
      _$SubSetorFromJson(json);

  Map<String, dynamic> toJson() => _$SubSetorToJson(this);

  SubSetor copyWith({
    String? identificador,
    String? nome,
    List<Atividade>? atividades,
  }) {
    return SubSetor(
      identificador: identificador ?? this.identificador,
      nome: nome ?? this.nome,
      atividades: atividades ?? this.atividades,
    );
  }
}
