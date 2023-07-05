part of 'aplicacoes_das_antenas_bloc.dart';

abstract class AplicacoesDasAntenasState {
  final List<Antena> antenas;
  final List<Aplicacao> aplicacoes;

  AplicacoesDasAntenasState({required this.antenas, required this.aplicacoes});

  AplicacoesDasAntenasState.fromLastState(
    AplicacoesDasAntenasState state, {
    List<Antena>? antenas,
    List<Aplicacao>? aplicacoes,
  })  : antenas = antenas ?? state.antenas,
        aplicacoes = aplicacoes ?? state.aplicacoes;
}

class AplicacoesDasAntenasNaoInicializado extends AplicacoesDasAntenasState {
  AplicacoesDasAntenasNaoInicializado(
      {super.antenas = const [], super.aplicacoes = const []});
}

class AplicacoesDasAntenasCarregarEmProgresso
    extends AplicacoesDasAntenasState {
  AplicacoesDasAntenasCarregarEmProgresso({
    super.antenas = const [],
    super.aplicacoes = const [],
  });
}

class AplicacoresDasAntenasCarregarSucesso extends AplicacoesDasAntenasState {
  AplicacoresDasAntenasCarregarSucesso.fromLastState(
    super.state, {
    required super.antenas,
    required super.aplicacoes,
  }) : super.fromLastState();
}

class AplicacoesDasAntenasCarregarFalha extends AplicacoesDasAntenasState {
  AplicacoesDasAntenasCarregarFalha({
    super.antenas = const [],
    super.aplicacoes = const [],
  });
}
