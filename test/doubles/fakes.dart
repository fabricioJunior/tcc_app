import 'package:tcc_app/models/aplicacao.dart';
import 'package:tcc_app/models/referencia.dart';

Aplicacao fakeAplicacao({
  String nome = 'nome',
  String descricao = 'descricao',
  List<Referencia> referencias = const [],
  List<int> antenasId = const [],
}) =>
    Aplicacao(
      nome,
      descricao,
      referencias,
      antenasId,
    );
