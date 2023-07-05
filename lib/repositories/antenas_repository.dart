import 'package:tcc_app/data_access/antenas_data_source.dart';
import 'package:tcc_app/models/antena.dart';

class AntenasRepository {
  final AntenasDataSource antenasDataSource;

  AntenasRepository(this.antenasDataSource);

  Future<List<Antena>> recuperarAntenasEnquanto(
    bool Function(Antena) test,
  ) async {
    var antenas = await antenasDataSource.getAll();
    return antenas.where(test).toList();
  }
}
