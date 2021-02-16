import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    final data = await sql.openDatabase(path.join(dbPath, 'Places.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_Places(id TEXT PRIMARY KEY,title TEXT,location TEXT,image TEXT,)',
      );
    }, version: 1);
  }
}
