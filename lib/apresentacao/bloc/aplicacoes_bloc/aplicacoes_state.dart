part of 'aplicacoes_bloc.dart';

abstract class AplicacoesState extends Equatable {
  final List<Aplicacao> aplicacoes;

  const AplicacoesState(this.aplicacoes);

  @override
  List<Object?> get props => [aplicacoes];

  AplicacoesState.fromLastState(
    AplicacoesState aplicacoesState, {
    List<Aplicacao>? aplicacoes,
  }) : aplicacoes = aplicacoes ?? aplicacoesState.aplicacoes;
}

class AplicacoesInicial extends AplicacoesState {
  const AplicacoesInicial(super.aplicacoes);
}

class AplicacoesCarregarEmProgresso extends AplicacoesState {
  AplicacoesCarregarEmProgresso.fromLastState(super.aplicacoesState)
      : super.fromLastState();
}

class AplicacoesCarregarSucesso extends AplicacoesState {
  AplicacoesCarregarSucesso.fromLastState(
    super.aplicacoesState, {
    required super.aplicacoes,
  }) : super.fromLastState();
}

class AplicacoesCarregarFalha extends AplicacoesState {
  AplicacoesCarregarFalha.fromLastState(super.aplicacoesState)
      : super.fromLastState();
}

class AplicacoesPesquisarEmProgresso extends AplicacoesState {
  AplicacoesPesquisarEmProgresso.fromLastState(super.aplicacoesState)
      : super.fromLastState();
}

class AplicacoesPesquisarSucesso extends AplicacoesState {
  AplicacoesPesquisarSucesso.fromLastState(
    super.aplicacoesState, {
    required super.aplicacoes,
  }) : super.fromLastState();
}

class AplicacoesPesquisarFalha extends AplicacoesState {
  AplicacoesPesquisarFalha.fromLastState(super.aplicacoesState)
      : super.fromLastState();
}
