import 'package:flutter/material.dart';

class RespostaCard extends StatelessWidget {
  final String resposta;
  final String textoDeSuporte;
  final void Function() onTap;

  const RespostaCard({
    super.key,
    required this.resposta,
    required this.textoDeSuporte,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resposta,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    textoDeSuporte,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
