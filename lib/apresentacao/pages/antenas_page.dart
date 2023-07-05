import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/antenas_bloc/antenas_bloc.dart';
import 'package:tcc_app/core/widgets_padroes/cards/antena_card.dart';
import 'package:tcc_app/core/widgets_padroes/imagens/logo_app.dart';

class AntenasPage extends StatelessWidget {
  const AntenasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: BackButton(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const LogoApp(
                      width: 62,
                      height: 60,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Busca por antena',
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
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buscaTextField(context),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(child: _antenasListView(context)),
          ],
        ),
      ),
    );
  }

  Widget _buscaTextField(BuildContext context) => TextField(
        decoration: const InputDecoration(
          hintText: 'Digite uma caracteristica da antena',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<AntenasBloc>().add(AntenasPesquisou(value));
        },
      );

  Widget _antenasListView(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: BlocBuilder<AntenasBloc, AntenasState>(
          bloc: _antenasBloc(context),
          builder: (context, state) {
            if (state is AntenasCarregarEmProgresso) {
              return Column(
                children: const [CircularProgressIndicator()],
              );
            } else if (state is AntenasCarregarFalha) {
              return const Text('Erro ao carregar antenas');
            }
            return ListView.builder(
              itemCount: state.antenas.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var antena = state.antenas[index];
                return AntenaCard(antena: antena);
              },
            );
          },
        ),
      );

  AntenasBloc _antenasBloc(BuildContext context) {
    var antenasBloc = context.read<AntenasBloc>();
    antenasBloc.add(AntenasInicializou());

    return antenasBloc;
  }
}
