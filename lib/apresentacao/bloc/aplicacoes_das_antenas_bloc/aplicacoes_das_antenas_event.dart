part of 'aplicacoes_das_antenas_bloc.dart';

abstract class AplicacoesDasAntenasEvent {}

class AplicacoesDasAntenasInicializou extends AplicacoesDasAntenasEvent {
  AplicacoesDasAntenasInicializou({required this.antenas});

  final List<Antena> antenas;
}

class AplicacoesDasAntenasInicializouSemAntenas
    extends AplicacoesDasAntenasEvent {
  final bool antenaDeCurtoAlcance;
  final FrequenciaDeOperacaoAnatena altaFrequencia;
  final bool antenaFixa;

  AplicacoesDasAntenasInicializouSemAntenas(
    this.antenaDeCurtoAlcance,
    this.altaFrequencia,
    this.antenaFixa,
  );
}
