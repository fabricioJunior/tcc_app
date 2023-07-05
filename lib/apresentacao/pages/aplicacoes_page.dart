import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/aplicacoes_bloc/aplicacoes_bloc.dart';
import 'package:tcc_app/core/widgets_padroes/cards/aplicacao_card.dart';
import 'package:tcc_app/core/widgets_padroes/imagens/logo_app.dart';
import 'package:tcc_app/models/aplicacao.dart';

class AplicacoesPage extends StatelessWidget {
  const AplicacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                BackButton(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const LogoApp(
              height: 39,
              width: 69,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Busca por aplicação',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _pesquisarField(context),
            ),
            Expanded(child: _aplicacoesList(context)),
          ],
        ),
      ),
    );
  }

  Widget _pesquisarField(BuildContext context) => TextField(
        decoration: const InputDecoration(
          hintText: 'Digite o nome da aplicação',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<AplicacoesBloc>().add(AplicacoesPesquisou(value));
        },
      );

  Widget _aplicacoesList(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: BlocBuilder<AplicacoesBloc, AplicacoesState>(
            builder: (context, state) {
          switch (state.runtimeType) {
            case AplicacoesCarregarEmProgresso:
            case AplicacoesPesquisarEmProgresso:
              return Column(
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            default:
              return ListView.builder(
                itemCount: state.aplicacoes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _aplicacaoCard(state.aplicacoes[index]);
                },
              );
          }
        }),
      );

  Widget _aplicacaoCard(Aplicacao aplicacao) =>
      AplicacaoCard(aplicacao: aplicacao);
}
