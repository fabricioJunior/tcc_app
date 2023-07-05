import 'package:flutter/cupertino.dart';
import 'package:tcc_app/models/aplicacao.dart';
import 'package:tcc_app/apresentacao/pages/antenas_page.dart';
import 'package:tcc_app/apresentacao/pages/aplicacao_page.dart';
import 'package:tcc_app/apresentacao/pages/aplicacoes_page.dart';
import 'package:tcc_app/apresentacao/pages/home.dart';
import 'package:tcc_app/apresentacao/pages/questionario_page/questionario_page.dart';

Map<String, WidgetBuilder> routes() {
  return {
    '/': (context) => const HomePage(),
    '/aplicacoes': (context) => const AplicacoesPage(),
    '/aplicacao': (context) {
      var arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      var aplicacao = arguments['aplicacao'] as Aplicacao;
      return AplicacaoPage(
        aplicacao: aplicacao,
      );
    },
    '/antenas': (context) => const AntenasPage(),
    '/questionario': (context) => QuestionarioPage(),
  };
}
