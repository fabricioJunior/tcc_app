part of 'antenas_bloc.dart';

abstract class AntenasEvent {}

class AntenasInicializou extends AntenasEvent {}

class AntenasPesquisou extends AntenasEvent {
  final String busca;

  AntenasPesquisou(this.busca);
}

class AntenasPesquisouPorCaracteristicas extends AntenasEvent {
  final bool antenaDeCurtoAlcance;
  final bool altaFrequencia;
  final bool antenaFixa;

  AntenasPesquisouPorCaracteristicas(
    this.antenaDeCurtoAlcance,
    this.altaFrequencia,
    this.antenaFixa,
  );
}
