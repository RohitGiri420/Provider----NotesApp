import 'package:flutter/material.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          UiHelper().CustomTextField(controller: titleController, text: "text"),
          UiHelper().CustomTextField(controller: descController, text: "Desc"),
          ElevatedButton(onPressed: (){

            //Add data function here

          }, child:Text("Sava") ),
        ],
      ),
    );
  }
}
