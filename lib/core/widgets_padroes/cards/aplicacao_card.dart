import 'package:flutter/material.dart';
import 'package:tcc_app/models/aplicacao.dart';

class AplicacaoCard extends StatelessWidget {
  final Aplicacao aplicacao;
  final void Function(Aplicacao aplicacao)? onTap;

  const AplicacaoCard({super.key, this.onTap, required this.aplicacao});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/aplicacao',
            arguments: {
              'aplicacao': aplicacao,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            aplicacao.nome,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
