import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providernoteapp/model/NoteModel.dart';
import 'package:providernoteapp/provider/NoteProvider.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  AddData(String title,String desc){
    if(title==""||desc==""){

    }
    else{
      context.read<NoteProvider>().addData(NotesModel(Title: title, Desc: desc));
    }     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          UiHelper().CustomTextField(controller: titleController, text: "text"),
          UiHelper().CustomTextField(controller: descController, text: "Desc"),
          ElevatedButton(onPressed: (){
            AddData(titleController.text.toString(), descController.text.toString());
            Navigator.pop(context);
          }, child:Text("Sava") ),
        ],
      ),
    );
  }
}
