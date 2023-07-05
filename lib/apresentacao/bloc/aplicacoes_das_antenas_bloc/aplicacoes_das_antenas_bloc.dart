import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/models/antena.dart';
import 'package:tcc_app/models/aplicacao.dart';
import 'package:tcc_app/repositories/antenas_repository.dart';
import 'package:tcc_app/repositories/aplicacoes_repository.dart';

part 'aplicacoes_das_antenas_state.dart';
part 'aplicacoes_das_antenas_event.dart';

class AplicacoesDasAntenasBloc
    extends Bloc<AplicacoesDasAntenasEvent, AplicacoesDasAntenasState> {
  AplicacoesDasAntenasBloc(
    this.aplicacoesRepository,
    this.antenasRepository,
  ) : super(AplicacoesDasAntenasNaoInicializado()) {
    on<AplicacoesDasAntenasInicializou>(_onAplicacoesDasAntenasInicializou);
    on<AplicacoesDasAntenasInicializouSemAntenas>(
      _onAplicacoesDasAntenasInicializouSemAntenas,
    );
  }

  final AplicacoesRepository aplicacoesRepository;
  final AntenasRepository antenasRepository;
  FutureOr<void> _onAplicacoesDasAntenasInicializou(
    AplicacoesDasAntenasInicializou event,
    Emitter<AplicacoesDasAntenasState> emit,
  ) async {
    try {
      emit(AplicacoesDasAntenasCarregarEmProgresso());
      var antenaIds = event.antenas.map((e) => e.id).toList();

      var aplicacoes = await aplicacoesRepository.recuperarAplicacoesEnquanto(
        (aplicacao) =>
            aplicacao.antenasId.any((antenaId) => antenaIds.contains(antenaId)),
      );
      emit(
        AplicacoresDasAntenasCarregarSucesso.fromLastState(
          state,
          antenas: event.antenas,
          aplicacoes: aplicacoes,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(AplicacoesDasAntenasCarregarFalha());
    }
  }

  FutureOr<void> _onAplicacoesDasAntenasInicializouSemAntenas(
    AplicacoesDasAntenasInicializouSemAntenas event,
    Emitter<AplicacoesDasAntenasState> emit,
  ) async {
    try {
      emit(AplicacoesDasAntenasCarregarEmProgresso());
      var alcace = event.antenaDeCurtoAlcance
          ? AlcanceDaAntena.curto
          : AlcanceDaAntena.longo;

      var antenas = await antenasRepository.recuperarAntenasEnquanto(
        (antena) =>
            antena.alcance == alcace &&
            antena.fixa == event.antenaFixa &&
            _dentroDaFaixaDeOperacao(event.altaFrequencia, antena.frequencia),
      );
      var antenaIds = antenas.map((e) => e.id).toList();

      var aplicacoes = await aplicacoesRepository.recuperarAplicacoesEnquanto(
        (aplicacao) =>
            aplicacao.antenasId.any((antenaId) => antenaIds.contains(antenaId)),
      );
      emit(
        AplicacoresDasAntenasCarregarSucesso.fromLastState(
          state,
          antenas: antenas,
          aplicacoes: aplicacoes,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(AplicacoesDasAntenasCarregarFalha());
    }
  }

  bool _dentroDaFaixaDeOperacao(
      FrequenciaDeOperacaoAnatena frequenciaDeOperacaoAnatena,
      double frequencia) {
    if (frequenciaDeOperacaoAnatena == FrequenciaDeOperacaoAnatena.ultraAlta &&
        frequencia >= 900) {
      return true;
    }
    if (frequenciaDeOperacaoAnatena == FrequenciaDeOperacaoAnatena.alta &&
        (frequencia >= 1 && frequencia <= 900)) {
      return true;
    }

    return true;
  }
}
