import 'package:flutter/cupertino.dart';
import 'package:providernoteapp/database/DbHelper.dart';
import 'package:providernoteapp/model/NoteModel.dart';

class NoteProvider extends ChangeNotifier{
  DbHelper db = DbHelper.db;
  List<NotesModel> arrlist=[];


  addData(NotesModel notesModel) async {
    var check = await db.addData(notesModel);
    if(check){
      arrlist = await db.getData();
      notifyListeners();

    }
  }

  updateData(NotesModel notesModel)async{
    var check = await db.UpdateData(notesModel);
    if(check){
      arrlist = await db.getData();
      notifyListeners();
    }
  }

  List<NotesModel> getNotes(){
    fetchData();
    return arrlist;
  }
  fetchData() async {
    arrlist=await db.getData();
    notifyListeners();
  }


  deleteData(int Id) async{
    db.deleteNote(Id);
    arrlist =await db.getData();
    notifyListeners();
  }
}