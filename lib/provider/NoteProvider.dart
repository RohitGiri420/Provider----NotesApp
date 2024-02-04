import 'package:flutter/cupertino.dart';
import 'package:providernoteapp/database/DbHelper.dart';
import 'package:providernoteapp/model/NoteModel.dart';

class NoteProvider extends ChangeNotifier{
  DbHelper db = DbHelper.db;
  List<NotesModel> arrlist=[];

  addData(NotesModel notesModel) async {
    var check =await  db.addData(notesModel);
    if(check) {
      fetchData();
    }
  }

  fetchData() async {
    arrlist=await db.getData();
    notifyListeners();
  }


}