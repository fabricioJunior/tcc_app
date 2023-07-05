import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'questionario_state.dart';
part 'questionario_event.dart';

class QuestionarioBloc extends Bloc<QuestionarioEvent, QuestionarioState> {
  QuestionarioBloc() : super(QuestionarioNaoInicializado()) {
    on<QuestionarioSelecionouAlcance>(_onQuestionarioSelecionouAlcance);
    on<QuestionarioSelecionouFaixaDeOperacao>(
      _onQuestionarioSelecionouFaixaDeOperacao,
    );
    on<QuestionarioSelecionouMobilidade>(_onQuestionarioSelecionouMobilidade);
  }

  FutureOr<void> _onQuestionarioSelecionouAlcance(
    QuestionarioSelecionouAlcance event,
    Emitter<QuestionarioState> emit,
  ) {
    emit(QuestionarioSelecionarlcanceSucesso(
      state,
      antenaDeCurtoAlcance: event.antenaDeCurtoAlcance,
    ));
  }

  FutureOr<void> _onQuestionarioSelecionouFaixaDeOperacao(
    QuestionarioSelecionouFaixaDeOperacao event,
    Emitter<QuestionarioState> emit,
  ) {
    emit(
      QuestionarioSelecionarFaixaDeOperacaoSucesso(
        state,
        altaFrequencia: event.altaFrequencia,
      ),
    );
  }

  FutureOr<void> _onQuestionarioSelecionouMobilidade(
    QuestionarioSelecionouMobilidade event,
    Emitter<QuestionarioState> emit,
  ) {
    emit(QuestionarioSelecionarMobilidadeSucesso(
      state,
      antenaFixa: event.antenaFixa,
    ));
  }
}

enum FrequenciaDeOperacaoAnatena {
  ultraAlta(mensagem: 'Frequência Ultra-Alta'),
  alta(mensagem: 'Frequência Alta'),
  baixa(mensagem: 'Frequência Baixa');

  final String mensagem;

  const FrequenciaDeOperacaoAnatena({required this.mensagem});
}
