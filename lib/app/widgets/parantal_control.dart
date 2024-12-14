
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../const/appColors.dart';
import '../const/spaces.dart';
import 'my_button_widget.dart';
import 'my_text_field_widget.dart';
import 'my_text_widget.dart';

class ParantalControl extends StatelessWidget {
  const ParantalControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.black87,
        surfaceTintColor: Colors.white,
        title: MyText(
          text: 'Parental Control',
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextField(
              hint: 'Password',
              isObSecure: true,
            ),
            Spaces.y1,
            MyTextField(
              hint: 'New Password',
              isObSecure: true,
            ),
            Spaces.y1,
            MyTextField(
              hint: 'Confirm Password',
              isObSecure: true,
            ),
          ],
        ),
        actions: [
          BorderButton(
            width: 10 * 2.w,
            borderColor: kOrangeColor,
            textColor: Colors.white,
            buttonText: 'Cancel',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyButton(
            backgroundColor: kOrangeColor,
            width: 10 * 2.w,
            onTap: () {
      
            },
            buttonText: 'ok',
          ),
        ],
      ),
    );
  }
}