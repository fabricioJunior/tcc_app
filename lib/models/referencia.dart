import 'package:json_annotation/json_annotation.dart';

part 'referencia.g.dart';

@JsonSerializable()
class Referencia {
  final String nome;
  final String link;

  Referencia(this.nome, this.link);

  factory Referencia.fromJson(Map<String, dynamic> json) =>
      _$ReferenciaFromJson(json);
}
