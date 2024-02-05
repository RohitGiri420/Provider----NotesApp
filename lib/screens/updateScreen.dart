import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/NoteModel.dart';
import '../provider/NoteProvider.dart';
import '../widgets/UiHelper.dart';
import 'dart:developer';

class UpdateScreen extends StatefulWidget {

  const UpdateScreen({super.key, required this.id});
  final int id;


  @override
  State<UpdateScreen> createState() => _UpdateScreenState();

}

class _UpdateScreenState extends State<UpdateScreen> {

  TextEditingController updatedtitleController = TextEditingController();
  TextEditingController updateddescController = TextEditingController();

  updateData(String title,String desc ,int Id){

    if(title ==""||desc ==""||Id==""){
      log("enter required field");
    }
    else{
      context.read<NoteProvider>().updateData(NotesModel(Title: title, Desc: desc,NoteID: Id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            UiHelper().CustomTextField(
                controller: updatedtitleController, text: "text"),
            UiHelper().CustomTextField(
                controller: updateddescController, text: "Desc"),
            ElevatedButton(
                onPressed: () {
                  updateData(updatedtitleController.text.toString(), updateddescController.text.toString(),widget.id);
                  Navigator.pop(context);
                },
                child: Text("Sava")),
          ],
        )

    );
  }
}
