import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/aplicacoes_das_antenas_bloc/aplicacoes_das_antenas_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/core/widgets_padroes/cards/aplicacao_card.dart';
import 'package:tcc_app/models/antena.dart';
import 'package:tcc_app/models/aplicacao.dart';

Future<void> showAplicacoesDasAntenasModal(
  BuildContext context,
  List<Antena> antenas,
  final String titulo,
) async {
  var nav = Navigator.of(context);
  Aplicacao? aplicacao = await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      builder: (_) {
        return BlocProvider<AplicacoesDasAntenasBloc>(
          create: (context) => AplicacoesDasAntenasBloc(
            context.read(),
            context.read(),
          )..add(AplicacoesDasAntenasInicializou(antenas: antenas)),
          child: AplicacoesDasAntenasModal(
            titulo: titulo,
          ),
        );
      });
  if (aplicacao != null) {
    if (context.mounted)
      // ignore: curly_braces_in_flow_control_structures
      nav.pushNamed('/aplicacao', arguments: {'aplicacao': aplicacao});
  }
}

Future<void> showAplicacoesDasAntenasModalSemAntenas(
  BuildContext context, {
  required bool antenaDeCurtoAlcance,
  required FrequenciaDeOperacaoAnatena altaFrequencia,
  required bool antenaFixa,
}) async {
  var titulo =
      'Aplicações de antenas de ${antenaDeCurtoAlcance ? 'CURTO ALCANCE' : 'LONGO ALCANCE'}, ${altaFrequencia.mensagem} e ${antenaFixa ? 'FIXAS' : 'MÓVEIS'}';
  Aplicacao? aplicacao = await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      builder: (_) {
        return BlocProvider<AplicacoesDasAntenasBloc>(
          create: (context) => AplicacoesDasAntenasBloc(
            context.read(),
            context.read(),
          )..add(AplicacoesDasAntenasInicializouSemAntenas(
              antenaDeCurtoAlcance,
              altaFrequencia,
              antenaFixa,
            )),
          child: AplicacoesDasAntenasModal(
            titulo: titulo,
          ),
        );
      });
  if (aplicacao != null) {
    // ignore: use_build_context_synchronously
    var nav = Navigator.of(context);

    if (context.mounted)
      // ignore: curly_braces_in_flow_control_structures
      nav.pushNamed('/aplicacao', arguments: {'aplicacao': aplicacao});
  }
}

class AplicacoesDasAntenasModal extends StatelessWidget {
  final String titulo;
  const AplicacoesDasAntenasModal({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: BackButton(),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              titulo,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Aplicações:',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(child: _aplicacoes()),
        ],
      ),
    );
  }

  Widget _aplicacoes() =>
      BlocBuilder<AplicacoesDasAntenasBloc, AplicacoesDasAntenasState>(
          builder: (context, state) {
        if (state is AplicacoesDasAntenasCarregarEmProgresso) {
          return Column(
            children: const [CircularProgressIndicator()],
          );
        }
        if (state is AplicacoesDasAntenasCarregarFalha) {
          return const Text('Falha ao carregar aplicações');
        }

        return Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: ListView.builder(
            itemCount: state.aplicacoes.length,
            itemBuilder: (context, index) {
              var aplicacao = state.aplicacoes[index];
              return AplicacaoCard(aplicacao: aplicacao);
            },
          ),
        );
      });
}
