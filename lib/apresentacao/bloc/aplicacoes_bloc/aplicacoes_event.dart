part of 'aplicacoes_bloc.dart';

abstract class AplicacoesEvent {}

class AplicacoesIniciou extends AplicacoesEvent {}

class AplicacoesPesquisou extends AplicacoesEvent {
  final String busca;

  AplicacoesPesquisou(this.busca);
}
