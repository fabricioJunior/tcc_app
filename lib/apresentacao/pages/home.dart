import 'package:flutter/material.dart';
import 'package:tcc_app/core/widgets_padroes/imagens/logo_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const LogoApp(
                        width: 102,
                        height: 64,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'My RFID',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Escolha uma opção de busca:',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              _buscaPorAplicacaoButton(context),
              const SizedBox(
                height: 16,
              ),
              _buscaPorAntenaButton(
                context,
              ),
              const SizedBox(
                height: 16,
              ),
              _buscaPorQuestionario(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buscaPorAplicacaoButton(BuildContext context) => _OpcaoDeBuscaCard(
        onTap: () {
          Navigator.pushNamed(context, '/aplicacoes');
        },
        opcao: 'Busca por aplicação',
        descricao:
            'Encontre aplicações de sistemas RFIDs buscando pelo nome da aplicação',
      );

  Widget _buscaPorAntenaButton(BuildContext context) => _OpcaoDeBuscaCard(
        onTap: () {
          Navigator.pushNamed(context, '/antenas');
        },
        opcao: 'Busca por antena',
        descricao:
            'Encontre aplicações de sistemas RFIDs buscando por uma antena',
      );
  Widget _buscaPorQuestionario(BuildContext context) => _OpcaoDeBuscaCard(
        onTap: () {
          Navigator.pushNamed(context, '/questionario');
        },
        descricao:
            'Encontre aplicações de sistemas RFIDs informando características de uma antena',
        opcao: 'Questionário',
      );
}

class _OpcaoDeBuscaCard extends StatelessWidget {
  final void Function() onTap;
  final String opcao;
  final String descricao;

  const _OpcaoDeBuscaCard({
    required this.onTap,
    required this.descricao,
    required this.opcao,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                opcao,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                descricao,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: const Color(0xFF747175)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
