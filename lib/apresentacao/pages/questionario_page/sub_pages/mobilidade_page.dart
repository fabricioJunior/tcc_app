import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/apresentacao/modais/aplicacoes_das_antenas_modal.dart';
import 'package:tcc_app/core/widgets_padroes/cards/resposta_card.dart';

class MobilidadePage extends StatelessWidget {
  const MobilidadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Expanded(flex: 20, child: BackButton()),
            Expanded(
              flex: 80,
              child: Text(
                'Questionário',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(flex: 20, child: SizedBox()),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Antena Fixa ?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 34,
        ),
        Expanded(child: _opcoes(context)),
      ],
    );
  }

  Widget _opcoes(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          children: [
            RespostaCard(
              resposta: 'Sim',
              textoDeSuporte: 'Antena fixada ou difícil locomoção',
              onTap: () {
                context
                    .read<QuestionarioBloc>()
                    .add(QuestionarioSelecionouMobilidade(antenaFixa: true));
                _abrirAplicacoesDasAntenas(context, true);
              },
            ),
            RespostaCard(
              resposta: 'Não',
              textoDeSuporte: 'Antena não fixada ou fácil locomoção',
              onTap: () {
                context
                    .read<QuestionarioBloc>()
                    .add(QuestionarioSelecionouMobilidade(antenaFixa: false));
                _abrirAplicacoesDasAntenas(context, false);
              },
            ),
          ],
        ),
      );

  void _abrirAplicacoesDasAntenas(BuildContext context, bool antenaFixa) {
    var state = context.read<QuestionarioBloc>().state;
    Navigator.of(context).pop();
    showAplicacoesDasAntenasModalSemAntenas(
      context,
      antenaDeCurtoAlcance: state.antenaDeCurtoAlcance!,
      altaFrequencia: state.frequenciaDeOperacao!,
      antenaFixa: antenaFixa,
    );
  }
}
