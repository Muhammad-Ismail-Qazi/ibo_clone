import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/appColors.dart';
import '../const/spaces.dart';
import 'my_button_widget.dart';
import 'my_text_widget.dart';

class LiveChannelSort extends StatelessWidget {
  const LiveChannelSort({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black87,
      surfaceTintColor: Colors.white,
      title: MyText(text: 'Live Channel Sort',color: Colors.white,textAlign: TextAlign.center,weight: FontWeight.w500,),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              title: MyText(text: 'Default',color: Colors.white,),
              value: true,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title: MyText(text: 'Order by A-Z',color: Colors.white,),
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title:MyText(text: 'Order by Z-A',color: Colors.white,),
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
        Spaces.y2,
        MyButton  (
            backgroundColor: kOrangeColor,
            width: 100,
            onTap: () => Navigator.pop(context), buttonText: 'OK')
      ],
    );
  }
}