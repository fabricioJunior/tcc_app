import 'package:json_annotation/json_annotation.dart';
import 'package:tcc_app/models/aplicacao.dart';
part 'atividade.g.dart';

@JsonSerializable()
class Atividade {
  final String identificador;
  final String nome;
  final List<Aplicacao> aplicacoes;

  Atividade({
    required this.identificador,
    required this.nome,
    required this.aplicacoes,
  });

  factory Atividade.fromJson(Map<String, dynamic> json) =>
      _$AtividadeFromJson(json);
  Map<String, dynamic> toJson() => _$AtividadeToJson(this);

  Atividade copyWith({
    String? identificador,
    String? nome,
    List<Aplicacao>? aplicacoes,
  }) {
    return Atividade(
      identificador: identificador ?? this.identificador,
      nome: nome ?? this.nome,
      aplicacoes: aplicacoes ?? this.aplicacoes,
    );
  }
}
