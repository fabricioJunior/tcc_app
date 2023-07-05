import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/models/antena.dart';
import 'package:tcc_app/repositories/antenas_repository.dart';

part 'antenas_event.dart';
part 'antenas_state.dart';

class AntenasBloc extends Bloc<AntenasEvent, AntenasState> {
  AntenasBloc(this.antenasRepository) : super(AntenasNaoInicilizado()) {
    on<AntenasInicializou>(_onAntenasInicializou);
    on<AntenasPesquisou>(_onAntenasPesquisou);
    on<AntenasPesquisouPorCaracteristicas>(
      _onAntenasPesquisouPorCaracteristicas,
    );
  }

  final AntenasRepository antenasRepository;

  FutureOr<void> _onAntenasInicializou(
    AntenasInicializou event,
    Emitter<AntenasState> emit,
  ) async {
    try {
      emit(AntenasCarregarEmProgresso());
      var antenas =
          await antenasRepository.recuperarAntenasEnquanto((p0) => true);

      emit(AntenasCarregarSucesso(antenas: antenas));
    } catch (e, s) {
      addError(e, s);
      emit(AntenasCarregarFalha());
    }
  }

  FutureOr<void> _onAntenasPesquisou(
    AntenasPesquisou event,
    Emitter<AntenasState> emit,
  ) async {
    try {
      emit(AntenasPesquisarEmProgresso());
      var antenas = await antenasRepository.recuperarAntenasEnquanto(
        (antena) =>
            antena.toString().toLowerCase().contains(event.busca.toLowerCase()),
      );

      emit(AntenasPesquisarSucesso(antenas: antenas));
    } catch (e, s) {
      addError(e, s);
      emit(AntenasPesquisarFalha());
    }
  }

  FutureOr<void> _onAntenasPesquisouPorCaracteristicas(
    AntenasPesquisouPorCaracteristicas event,
    Emitter<AntenasState> emit,
  ) async {
    try {
      emit(AntenasPesquisarEmProgresso());
      var alcace = event.antenaDeCurtoAlcance
          ? AlcanceDaAntena.curto
          : AlcanceDaAntena.longo;

      var antenas = await antenasRepository.recuperarAntenasEnquanto(
        (antena) =>
            antena.alcance == alcace &&
            antena.fixa == event.antenaFixa &&
            event.altaFrequencia == _altaFrequencia(antena.frequencia),
      );

      emit(AntenasPesquisarSucesso(antenas: antenas));
    } catch (e, s) {
      addError(e, s);
      emit(AntenasPesquisarFalha());
    }
  }

  bool _altaFrequencia(double frequencia) => frequencia >= 900;
}
