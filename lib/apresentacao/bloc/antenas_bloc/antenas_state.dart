part of 'antenas_bloc.dart';

abstract class AntenasState {
  final List<Antena> antenas;

  AntenasState({required this.antenas});

  AntenasState.fromLastState(AntenasState state, {List<Antena>? antenas})
      : antenas = antenas ?? state.antenas;
}

class AntenasNaoInicilizado extends AntenasState {
  AntenasNaoInicilizado({super.antenas = const []});
}

class AntenasCarregarEmProgresso extends AntenasState {
  AntenasCarregarEmProgresso({super.antenas = const []});
}

class AntenasCarregarSucesso extends AntenasState {
  AntenasCarregarSucesso({required super.antenas});
}

class AntenasCarregarFalha extends AntenasState {
  AntenasCarregarFalha({super.antenas = const []});
}

class AntenasPesquisarEmProgresso extends AntenasState {
  AntenasPesquisarEmProgresso({super.antenas = const []});
}

class AntenasPesquisarSucesso extends AntenasState {
  AntenasPesquisarSucesso({
    required super.antenas,
  });
}

class AntenasPesquisarFalha extends AntenasState {
  AntenasPesquisarFalha({super.antenas = const []});
}
