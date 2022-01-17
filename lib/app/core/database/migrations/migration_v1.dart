import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''CREATE TABLE TODO (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
     DESCRICAO VARCHAR(500) NOT NULL,
      DATA_HORA DATETIME, FINALIZANDO INTEGER
    )''');
  }

  @override
  void update(Batch batch) {}
}
