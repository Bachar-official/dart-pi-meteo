import 'package:pi_dart_app/entity/measure.dart';
import 'package:sqlite3/sqlite3.dart';

class DBHandler {
  late final Database database;
  final String _tableName = 'measure';

  DBHandler({required this.database});

  void addMeasure(Measure measure) {
    database.execute(
        'INSERT into $_tableName(`date`, `temperature`, `humidity`, `pressure`) VALUES ${measure.toSqlValues()}');
  }
}
