import 'package:flutter/material.dart';
import 'package:ibo_clone/app/widgets/my_button_widget.dart';

import '../const/appColors.dart';
import 'my_text_widget.dart';

class HideLiveCategories extends StatelessWidget {
  const HideLiveCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.black87,
      surfaceTintColor: Colors.white,
      title: MyText(text: 'Hide Live Categories',color: Colors.white,textAlign: TextAlign.center,weight: FontWeight.w500,),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              title: MyText(text: 'Demo ibo',color: Colors.white),
              value: false,
              onChanged: (value) {},
            ),

          ],
        ),
      ),
      actions: [
        BorderButton (
            borderColor: kOrangeColor,
            textColor: kwhite,
            width: 100,
            onTap: () => Navigator.pop(context), buttonText: 'Cancel'),
        MyButton  (
            backgroundColor: kOrangeColor,
            width: 100,
            onTap: () => Navigator.pop(context), buttonText: 'Select All'),
        MyButton  (
            backgroundColor: kOrangeColor,
            width: 100,
            onTap: () => Navigator.pop(context), buttonText: 'OK')
      ],
    );
  }
}