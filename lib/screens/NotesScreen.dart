import 'package:flutter/material.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  UiHelper ui = UiHelper();
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
                  ui.CustomFilterContainer("All (70)"),
                  SizedBox(width: 20,),
                  ui.CustomFilterContainer("Important"),
                  SizedBox(width: 20,),
                  ui.CustomFilterContainer("Bookmarked"),
                  SizedBox(width: 20,),
                  ui.CustomFilterContainer("Trashed"),
                          ],
              ),
            )

          ],
        ),
      ),


    );
  }
}
