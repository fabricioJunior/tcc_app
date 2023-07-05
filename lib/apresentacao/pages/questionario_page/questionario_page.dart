import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/apresentacao/bloc/questionario_bloc/questionario_bloc.dart';
import 'package:tcc_app/apresentacao/pages/questionario_page/sub_pages/distancia_page.dart';
import 'package:tcc_app/apresentacao/pages/questionario_page/sub_pages/faixa_de_operacao_page.dart';
import 'package:tcc_app/apresentacao/pages/questionario_page/sub_pages/mobilidade_page.dart';

class QuestionarioPage extends StatelessWidget {
  final PageController pageController = PageController();

  QuestionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<QuestionarioBloc, QuestionarioState>(
        listener: (context, state) {
          if (state is QuestionarioSelecionarlcanceSucesso) {
            pageController.jumpToPage(1);
          }
          if (state is QuestionarioSelecionarFaixaDeOperacaoSucesso) {
            pageController.jumpToPage(2);
          }
        },
        child: SafeArea(
          child: PageView(
            controller: pageController,
            pageSnapping: false,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages(),
          ),
        ),
      ),
    );
  }
}

List<Widget> _pages() => const [
      DistanciaPage(),
      FaixaDeOperacaoPage(),
      MobilidadePage(),
    ];
