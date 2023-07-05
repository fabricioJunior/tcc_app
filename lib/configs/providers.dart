import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/antenas_bloc/antenas_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/aplicacoes_bloc/aplicacoes_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/data_access/antenas_data_source.dart';
import 'package:tcc_app/data_access/aplicacoes_data_source.dart';
import 'package:tcc_app/repositories/antenas_repository.dart';
import 'package:tcc_app/repositories/aplicacoes_repository.dart';

var firebaseInstance = FirebaseFirestore.instance;

class Providers extends StatelessWidget {
  final Widget child;
  const Providers({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return _RepositoresProviders(
      child: _BlocProviders(child: child),
    );
  }
}

class _BlocProviders extends StatelessWidget {
  final Widget child;
  const _BlocProviders({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AplicacoesBloc>(
          create: (context) => AplicacoesBloc(
            context.read<AplicacoesRepository>(),
          )..add(
              AplicacoesIniciou(),
            ),
        ),
        BlocProvider<AntenasBloc>(
          create: (context) => AntenasBloc(
            context.read<AntenasRepository>(),
          ),
        ),
        BlocProvider<QuestionarioBloc>(
          create: (context) => QuestionarioBloc(),
        ),
      ],
      child: child,
    );
  }
}

class _RepositoresProviders extends StatelessWidget {
  final Widget child;
  const _RepositoresProviders({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _aplicacoesRepository(),
        _antenasRepository(),
      ],
      child: child,
    );
  }

  RepositoryProvider<AplicacoesRepository> _aplicacoesRepository() =>
      RepositoryProvider(
        create: (context) => AplicacoesRepository(
          AplicacoesDataSource(firebaseInstance),
        ),
      );

  RepositoryProvider<AntenasRepository> _antenasRepository() =>
      RepositoryProvider(
        create: (context) => AntenasRepository(
          AntenasDataSource(firebaseInstance),
        ),
      );
}
