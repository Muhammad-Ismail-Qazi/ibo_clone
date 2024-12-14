import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibo_clone/app/const/appColors.dart';
import 'package:sizer/sizer.dart';

import '../const/spaces.dart';
import 'my_button_widget.dart';
import 'my_text_widget.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.black87,
        surfaceTintColor: Colors.white,
        title: MyText(
          text: 'Select Language',
          color: kwhite,
          textAlign: TextAlign.center,
          size: 18.sp,
          weight: FontWeight.w500,
        ),
        content: SizedBox(
          width: 100.w,
          child: ListView(
            children: [
              ListTile(title: MyText(text: 'English',color: kwhite,)),
              ListTile(title: MyText(text: 'Spanish',color: kwhite,)),
              ListTile(title: MyText(text: 'French',color: kwhite,)),
              ListTile(title: MyText(text: 'German',color: kwhite,)),
              ListTile(title: MyText(text: 'Chinese',color: kwhite,)),
            ],
          ),
        ),
        actions: [
          BorderButton (
            borderColor: kOrangeColor,
              textColor: kwhite,
              width: 100,
              onTap: () => Navigator.pop(context), buttonText: 'Cancel'),
          Spaces.y2,
          MyButton  (
              backgroundColor: kOrangeColor,
              width: 100,
              onTap: () => Navigator.pop(context), buttonText: 'OK')

        ]);
  }
}