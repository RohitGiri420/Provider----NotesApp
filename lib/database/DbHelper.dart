import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper db = DbHelper();
  Database? _database;

  static String TABLENAME = "AllNotes";
  static String NOTEID = "Notes Id";
  static String NOTETITLE = "Note Title";
  static String NOTEDESC = "Note Description";

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "NotesDb.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create tableB $TABLENAME($NOTEID INTEGER PRIMARY KEY, $NOTETITLE TEXT, $NOTEDESC TEXT)");
      },
    );
  }
}
