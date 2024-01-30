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

  CustomFilterContainer(String text, Color color, Color color2) => Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(width: 1, color: Colors.white54)),
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 11, right: 11),
            child: Text(
              "$text",
              style:
                  TextStyle(fontFamily: 'Custom', fontSize: 16, color: color2),
            ),
          ),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
        ),
      );

  CustomTextField(
          {required TextEditingController controller,
          required String text}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: TextField(
          controller: controller,
          style: TextStyle(fontFamily: "Custom", color: Colors.black54),
          decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
              label: Text(text),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 1,
                ),
              )),
        ),
      );
}
