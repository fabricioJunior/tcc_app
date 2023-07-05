import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/core/widgets_padroes/cards/resposta_card.dart';

class DistanciaPage extends StatelessWidget {
  const DistanciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            'Qual a distância entre o leitor e as TAGs ?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
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
              resposta: 'Próxima',
              textoDeSuporte: 'distância menor que 1 metro',
              onTap: () {
                context.read<QuestionarioBloc>().add(
                    QuestionarioSelecionouAlcance(antenaDeCurtoAlcance: true));
              },
            ),
            RespostaCard(
              resposta: 'Distante',
              textoDeSuporte: 'distância maior que 1 metro',
              onTap: () {
                context.read<QuestionarioBloc>().add(
                    QuestionarioSelecionouAlcance(antenaDeCurtoAlcance: false));
              },
            ),
          ],
        ),
      );
}
