import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/antenas_bloc/antenas_bloc.dart';
import 'package:tcc_app/core/widgets_padroes/cards/antena_card.dart';
import 'package:tcc_app/models/aplicacao.dart';
import 'package:url_launcher/url_launcher.dart';

class AplicacaoPage extends StatelessWidget {
  final Aplicacao aplicacao;
  const AplicacaoPage({required this.aplicacao, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  BackButton(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _descricaoRow(context),
                      const SizedBox(
                        height: 16,
                      ),
                      _referenciaRow(context),
                      const SizedBox(
                        height: 16,
                      ),
                      _antenasRow(context)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descricaoRow(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.description,
            ),
          ),
          Flexible(
            child: Text(
              aplicacao.descricao,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      );

  Widget _referenciaRow(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.book,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...aplicacao.referencias.map(
                  (referencia) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(referencia.link));
                      },
                      child: Text(
                        referencia.nome,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget _antenasRow(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Antenas utilizadas:')),
          BlocBuilder<AntenasBloc, AntenasState>(
              bloc: context.read<AntenasBloc>()..add(AntenasInicializou()),
              builder: (context, state) {
                if (state is AntenasCarregarEmProgresso) {
                  return const CircularProgressIndicator();
                }
                var antenasUtilizadas = state.antenas
                    .where((antena) => aplicacao.antenasId.contains(antena.id))
                    .toList();
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: antenasUtilizadas.length,
                  itemBuilder: (context, index) {
                    var antena = antenasUtilizadas[index];
                    return AntenaCard(antena: antena);
                  },
                );
              }),
        ],
      );
}
