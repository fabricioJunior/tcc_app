import 'package:flutter/material.dart';
import 'package:tcc_app/apresentacao/modais/aplicacoes_das_antenas_modal.dart';
import 'package:tcc_app/models/antena.dart';

class AntenaCard extends StatelessWidget {
  final Antena antena;

  const AntenaCard({
    required this.antena,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showAplicacoesDasAntenasModal(context, [antena], antena.nome);
        },
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.nfc,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${antena.nome} - ${antena.frequencia} Mhz',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('${antena.alcance.nome} - ${antena.polarizacao.nome}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
