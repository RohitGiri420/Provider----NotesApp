import 'package:flutter/material.dart';
import 'package:providernoteapp/widgets/UiHelper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //BACKGROUND COLOR........................................................
      backgroundColor: Color.fromRGBO(8, 8, 8, 1),

      //APP BAR.................................................................
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(8, 8, 8, 1),
        title: UiHelper().CustomAppBar(),
      ),


    );
  }
}
