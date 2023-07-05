import 'package:tcc_app/core/firebase_data_source_base.dart';
import 'package:tcc_app/models/aplicacao.dart';

class AplicacoesDataSource extends FirebaseDataSourceBase<Aplicacao> {
  AplicacoesDataSource(super.instance);

  @override
  String get collectionPath => 'aplicacoes';

  @override
  Aplicacao fromJson(Map<String, dynamic> json) {
    return Aplicacao.fromJson(json);
  }
}
