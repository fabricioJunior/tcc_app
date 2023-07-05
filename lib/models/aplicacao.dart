import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tcc_app/models/referencia.dart';
part 'aplicacao.g.dart';

@JsonSerializable()
class Aplicacao extends Equatable {
  final String nome;
  final String descricao;
  final List<Referencia> referencias;

  final List<int> antenasId;

  const Aplicacao(
    this.nome,
    this.descricao,
    this.referencias,
    this.antenasId,
  );

  Map<String, dynamic> toJson() => _$AplicacaoToJson(this);

  factory Aplicacao.fromJson(Map<String, dynamic> json) =>
      _$AplicacaoFromJson(json);

  @override
  List<Object?> get props => [
        nome,
        descricao,
        referencias,
        antenasId,
      ];
}
