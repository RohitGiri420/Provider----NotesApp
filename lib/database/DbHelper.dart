import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:providernoteapp/model/NoteModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper db = DbHelper();
  Database? _database;

  static String TABLENAME = "AllNotes";
  static String NOTEID = "NotesId";
  static String NOTETITLE = "NoteTitle";
  static String NOTEDESC = "NoteDescription";

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

  Future<bool> addData(NotesModel notesModel) async{

    var Db = await getDb();
    var check = await Db.insert("$TABLENAME", notesModel.tooMap());
    return check>0;
  }


}
