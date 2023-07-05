import 'package:tcc_app/data_access/aplicacoes_data_source.dart';
import 'package:tcc_app/models/aplicacao.dart';

class AplicacoesRepository {
  final AplicacoesDataSource aplicacoesDataSource;

  AplicacoesRepository(this.aplicacoesDataSource);
  Future<List<Aplicacao>> recuperarAplicacoes() {
    return aplicacoesDataSource.getAll();
  }

  Future<List<Aplicacao>> recuperarAplicacoesEnquanto(
    bool Function(Aplicacao aplicacao) teste,
  ) async {
    var all = await aplicacoesDataSource.getAll();
    return all.where(teste).toList();
  }
}
