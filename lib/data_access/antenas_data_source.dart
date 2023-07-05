import 'package:tcc_app/core/firebase_data_source_base.dart';
import 'package:tcc_app/models/antena.dart';

class AntenasDataSource extends FirebaseDataSourceBase<Antena> {
  AntenasDataSource(super.instance);

  @override
  String get collectionPath => 'antenas';

  @override
  Antena fromJson(Map<String, dynamic> json) {
    return Antena.fromJson(json);
  }
}
