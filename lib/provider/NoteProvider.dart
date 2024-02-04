import 'package:flutter/cupertino.dart';
import 'package:providernoteapp/database/DbHelper.dart';
import 'package:providernoteapp/model/NoteModel.dart';

class NoteProvider extends ChangeNotifier{
  DbHelper db = DbHelper.db;
  var arrlist;

  addData(NotesModel notesModel){
    db.addData(notesModel);
    notifyListeners();
  }

  fetchData(){
    arrlist=db.getData();
    return arrlist;
  }


}