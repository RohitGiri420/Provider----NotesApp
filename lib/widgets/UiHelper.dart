import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {

  CustomAppBar()=> Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(backgroundImage: AssetImage('asset/images/img_1.png')),
        Text("Hii,Rohit",style: TextStyle(fontFamily: "Custom",color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
        SizedBox(width: 150,),
        CircleAvatar(child: Icon(Icons.menu_rounded,color: Colors.white,),backgroundColor: Colors.white12),
      ],
    ),
  );
  
}