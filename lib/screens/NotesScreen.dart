import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providernoteapp/database/DbHelper.dart';
import 'package:providernoteapp/model/NoteModel.dart';
import 'package:providernoteapp/provider/NoteProvider.dart';
import 'package:providernoteapp/screens/addScreen.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NotesModel> arrlist = [];
  TextEditingController updatedtitleController = TextEditingController();
  TextEditingController updateddescController = TextEditingController();

  UiHelper uihelper = UiHelper();

  UiHelper ui = UiHelper();

  @override

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        arrlist = context.read<NoteProvider>().arrlist;

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
                    ui.CustomFilterContainer(
                        "All (70)", Colors.white, Colors.black54),
                    SizedBox(
                      width: 15,
                    ),
                    ui.CustomFilterContainer(
                        "Important", Colors.black, Colors.white),
                    SizedBox(
                      width: 15,
                    ),
                    ui.CustomFilterContainer(
                        "Bookmarked", Colors.black, Colors.white),
                    SizedBox(
                      width: 15,
                    ),
                    ui.CustomFilterContainer(
                        "Trashed", Colors.black, Colors.white),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),


              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text("${arrlist[index].Title}"),
                      subtitle: Text("${arrlist[index].Desc}"),
                    ),
                  ),
                  itemCount: arrlist.length,
                ),
              )
            ],
          ),
        ),




        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScreen(),
                ));
          },
          child: Icon(
            Icons.add,
            size: 32,
          ),
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );}
    );
  }
}
