import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {

  CustomAppBar()=> Container(
    child: Row(
      children: [
        CircleAvatar(),
        Text("Hii,Rohit"),
        SizedBox(),
        Icon(Icons.menu),
      ],
    ),
  );
}