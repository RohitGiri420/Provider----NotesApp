import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:providernoteapp/database/DbHelper.dart';
import 'package:providernoteapp/model/NoteModel.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<NotesModel> arrlist = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController updatedtitleController = TextEditingController();
  TextEditingController updateddescController = TextEditingController();

  UiHelper uihelper = UiHelper();

  UiHelper ui = UiHelper();


  addData(String title,String desc){
    if(title==""||desc=="") {
      log("Enter rquired Field");
    }
    else{
      DbHelper().addData(NotesModel(Title: title, Desc: desc));
    }
  }

  getData()async {
    arrlist = await DbHelper().getData();
    setState(() {

    });
  }

  updateData(String title,String desc,int id){
    if(title==""||desc==""){
      log("enter required field");
    }
    else{
      DbHelper().UpdateData(NotesModel(Title: title, Desc: desc,NoteID: id));
      log("data updated sucessfully");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //BACKGROUND COLOR........................................................
      backgroundColor: Color.fromRGBO(8, 8, 8, 1),


      //APP BAR.................................................................
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(8, 8, 8, 1),
        title: ui.CustomAppBar(),
      ),


      //BODY....................................................................
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ui.CustomText(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ui.CustomFilterContainer("All (70)",Colors.white,Colors.black54),
                  SizedBox(width: 15,),
                  ui.CustomFilterContainer("Important",Colors.black,Colors.white),
                  SizedBox(width: 15,),
                  ui.CustomFilterContainer("Bookmarked",Colors.black,Colors.white),
                  SizedBox(width: 15,),
                  ui.CustomFilterContainer("Trashed",Colors.black,Colors.white),
                          ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (context)
                    {
                      return SingleChildScrollView(
                        child: Container(
                          height: 500,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 50,),
                              Text("update Notes", style: TextStyle(
                                  fontFamily: "Custom",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54),),
                                  uihelper.CustomTextField(controller: updatedtitleController, text: "Title"),
                                  uihelper.CustomTextField(controller: updateddescController, text: "Description"),
                              ElevatedButton(onPressed: () {
                                updateData(updatedtitleController.text.toString(), updateddescController.text.toString(), arrlist[index].NoteID!);
                                getData();
                                Navigator.pop(context);
                              }, child: Text("Update")),

                            ],
                          ),

                        ),
                      );
                    });
                  },
                  title: Text("${arrlist[index].Title}"),
                  subtitle: Text("${arrlist[index].Desc}"),
                  trailing: IconButton(onPressed: (){
                    DbHelper().deleteNote(arrlist[index].NoteID!);
                    getData();
                  },icon: Icon(Icons.delete_rounded)),
                ),
              ),
              itemCount: arrlist.length,
              ),
            )
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){

        showModalBottomSheet(context: context, builder: (context) {

          return SingleChildScrollView(
            child: Container(
              height: 500,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text("Add Notes", style: TextStyle(fontFamily: "Custom",fontSize:25,fontWeight: FontWeight.w700,color: Colors.black54),),
                  uihelper.CustomTextField(controller: titleController,text: "Title"),
                  uihelper.CustomTextField(controller: descController,text: "Description"),
                  ElevatedButton(onPressed: (){
                    addData(titleController.text.toString(), descController.text.toString());
                    getData();
                    Navigator.pop(context);
                  }, child: Text("Save")),

                ],
              ),
            
            ),
          );

        },);

      },


      child: Icon(Icons.add,color: Colors.white,size: 30,),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white),
        ),
        backgroundColor: Colors.brown.shade100,
      ),
    );
  }
}

