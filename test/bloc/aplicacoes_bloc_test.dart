import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tcc_app/apresentacao/bloc/aplicacoes_bloc/aplicacoes_bloc.dart';
import 'package:tcc_app/models/aplicacao.dart';

import '../doubles/fakes.dart';
import '../doubles/repositores.mocks.dart';

late MockAplicacoesRepository aplicacoesRepository;

late AplicacoesBloc aplicacoesBloc;

void main() {
  setUp(() {
    aplicacoesRepository = MockAplicacoesRepository();
    aplicacoesBloc = AplicacoesBloc(aplicacoesRepository);
  });

  //fakes
  var aplicacoesInicialState = const AplicacoesInicial([]);
  var aplicacao1 = fakeAplicacao(descricao: 'descricao 1');
  var aplicacao2 = fakeAplicacao(descricao: 'descricao 2 ');

  var aplicacoes = [aplicacao1, aplicacao2];

  blocTest<AplicacoesBloc, AplicacoesState>(
    'emite estado de sucesso após carregar aplicacoes',
    build: () => aplicacoesBloc,
    setUp: () {
      _setupRecuperarAplicacoes(aplicacoes);
    },
    act: (bloc) => bloc.add(AplicacoesIniciou()),
    expect: () {
      var loadState =
          AplicacoesCarregarEmProgresso.fromLastState(aplicacoesInicialState);
      var sucessState = AplicacoesCarregarSucesso.fromLastState(loadState,
          aplicacoes: aplicacoes);
      return [
        loadState,
        sucessState,
      ];
    },
    verify: (bloc) {
      verify(aplicacoesRepository.recuperarAplicacoes());
    },
  );

  blocTest<AplicacoesBloc, AplicacoesState>(
    'emite estado de sucesso após fazer pesquisa',
    build: () => aplicacoesBloc,
    setUp: () {
      _setupRecuperarAplicacoesEquanto(aplicacoes);
    },
    act: (bloc) => bloc.add(AplicacoesPesquisou('busca')),
    expect: () {
      var loadState =
          AplicacoesPesquisarEmProgresso.fromLastState(aplicacoesInicialState);
      var sucessState = AplicacoesPesquisarSucesso.fromLastState(
        loadState,
        aplicacoes: aplicacoes,
      );
      return [
        loadState,
        sucessState,
      ];
    },
    verify: (bloc) {
      verify(aplicacoesRepository.recuperarAplicacoesEnquanto((any)));
    },
  );
}

void _setupRecuperarAplicacoes(List<Aplicacao> aplicacoes) {
  when(aplicacoesRepository.recuperarAplicacoes())
      .thenAnswer((_) async => aplicacoes);
}

void _setupRecuperarAplicacoesEquanto(List<Aplicacao> aplicacoes) {
  when(aplicacoesRepository.recuperarAplicacoesEnquanto(any))
      .thenAnswer((_) async => aplicacoes);
}
