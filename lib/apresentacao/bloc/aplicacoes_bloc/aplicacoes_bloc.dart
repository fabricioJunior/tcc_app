import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/models/aplicacao.dart';
import 'package:tcc_app/repositories/aplicacoes_repository.dart';

part 'aplicacoes_event.dart';
part 'aplicacoes_state.dart';

class AplicacoesBloc extends Bloc<AplicacoesEvent, AplicacoesState> {
  AplicacoesBloc(this.aplicacoesRepository)
      : super(const AplicacoesInicial([])) {
    on<AplicacoesIniciou>(_onAplicacoesIniciou);
    on<AplicacoesPesquisou>(_onAplicacoesPesquisou);
  }

  final AplicacoesRepository aplicacoesRepository;

  FutureOr<void> _onAplicacoesIniciou(
    AplicacoesIniciou event,
    Emitter<AplicacoesState> emit,
  ) async {
    try {
      emit(AplicacoesCarregarEmProgresso.fromLastState(state));
      var aplicacoes = await aplicacoesRepository.recuperarAplicacoes();
      emit(AplicacoesCarregarSucesso.fromLastState(
        state,
        aplicacoes: aplicacoes,
      ));
    } catch (e, s) {
      emit(AplicacoesCarregarFalha.fromLastState(state));
      addError(e, s);
    }
  }

  FutureOr<void> _onAplicacoesPesquisou(
    AplicacoesPesquisou event,
    Emitter<AplicacoesState> emit,
  ) async {
    try {
      emit(AplicacoesPesquisarEmProgresso.fromLastState(state));
      var resultadoDaBusca =
          await aplicacoesRepository.recuperarAplicacoesEnquanto(
        (aplicacao) => aplicacao
            .toString()
            .toLowerCase()
            .contains(event.busca.toLowerCase()),
      );

      emit(
        AplicacoesPesquisarSucesso.fromLastState(
          state,
          aplicacoes: resultadoDaBusca,
        ),
      );
    } catch (e, s) {
      emit(AplicacoesPesquisarFalha.fromLastState(state));
      addError(e, s);
    }
  }
}
