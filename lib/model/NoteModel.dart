import 'package:providernoteapp/database/DbHelper.dart';

class NotesModel {
  int? NoteID;
  String Title;
  String Desc;

  NotesModel({required this.Title, required this.Desc, this.NoteID});

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
        Title: map[DbHelper.NOTETITLE],
        Desc: map[DbHelper.NOTEDESC],
        NoteID: map[DbHelper.NOTEID]);
  }

  Map<String, dynamic> tooMap() {
    return {
      DbHelper.NOTETITLE: Title,
      DbHelper.NOTEDESC: Desc,
      DbHelper.NOTEID: NoteID
    };
  }
}
