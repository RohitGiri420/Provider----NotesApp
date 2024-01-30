import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  CustomAppBar() => Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(backgroundImage: AssetImage('asset/images/img_1.png')),
            Text(
              "Hii,Rohit",
              style: TextStyle(
                  fontFamily: "Custom",
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 150,
            ),
            CircleAvatar(
                child: Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.white12),
          ],
        ),
      );

  CustomText() => Text(
        "My Notes",
        style: TextStyle(
            fontSize: 40,
            fontFamily: 'Custom',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      );

  CustomFilterContainer(String text)=>Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 11,right: 11),
      child: Text("$text",style: TextStyle(fontFamily: 'Custom', fontSize: 16),),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50)
    ),
  );
}
