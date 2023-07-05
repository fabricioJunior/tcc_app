part of 'questionario_bloc.dart';

abstract class QuestionarioState {
  QuestionarioState({
    this.antenaDeCurtoAlcance,
    this.frequenciaDeOperacao,
    this.antenaFixa,
  });

  final bool? antenaDeCurtoAlcance;
  final FrequenciaDeOperacaoAnatena? frequenciaDeOperacao;
  final bool? antenaFixa;

  QuestionarioState.fromLastState(
    QuestionarioState state, {
    bool? antenaDeCurtoAlcance,
    FrequenciaDeOperacaoAnatena? altaFrequencia,
    bool? antenaFixa,
  })  : antenaDeCurtoAlcance =
            antenaDeCurtoAlcance ?? state.antenaDeCurtoAlcance,
        frequenciaDeOperacao = altaFrequencia ?? state.frequenciaDeOperacao,
        antenaFixa = antenaFixa ?? state.antenaFixa;
}

class QuestionarioNaoInicializado extends QuestionarioState {}

class QuestionarioSelecionarlcanceSucesso extends QuestionarioState {
  QuestionarioSelecionarlcanceSucesso(
    QuestionarioState state, {
    required super.antenaDeCurtoAlcance,
  }) : super.fromLastState(state);
}

class QuestionarioSelecionarFaixaDeOperacaoSucesso extends QuestionarioState {
  QuestionarioSelecionarFaixaDeOperacaoSucesso(
    QuestionarioState state, {
    required super.altaFrequencia,
  }) : super.fromLastState(state);
}

class QuestionarioSelecionarMobilidadeSucesso extends QuestionarioState {
  QuestionarioSelecionarMobilidadeSucesso(
    QuestionarioState state, {
    required super.antenaFixa,
  }) : super.fromLastState(
          state,
        );
}
