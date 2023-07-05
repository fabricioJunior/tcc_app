part of 'questionario_bloc.dart';

abstract class QuestionarioEvent {}

class QuestionarioSelecionouAlcance extends QuestionarioEvent {
  QuestionarioSelecionouAlcance({required this.antenaDeCurtoAlcance});
  final bool antenaDeCurtoAlcance;
}

class QuestionarioSelecionouFaixaDeOperacao extends QuestionarioEvent {
  QuestionarioSelecionouFaixaDeOperacao({required this.altaFrequencia});
  final FrequenciaDeOperacaoAnatena altaFrequencia;
}

class QuestionarioSelecionouMobilidade extends QuestionarioEvent {
  QuestionarioSelecionouMobilidade({required this.antenaFixa});
  final bool antenaFixa;
}
