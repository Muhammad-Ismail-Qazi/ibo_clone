import 'package:flutter/material.dart';
import 'package:ibo_clone/app/widgets/my_button_widget.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:sizer/sizer.dart';

import '../const/appColors.dart';
import '../const/spaces.dart';

class SidePannel extends StatelessWidget {
  const SidePannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35, // Adjust width as needed
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 8), // Spacing from other elements
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6), // Semi-transparent background
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Subtle shadow
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(  // Wrap the content in a scroll view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              width: 10 * 2.w,
              onTap: () {}, // Open website action
              backgroundColor: kOrangeColor,
              buttonText: "Open Website",
            ),
            Spaces.y3,
            MyText(
              text: "Your MAC is Free Trial",
              color: Colors.white,
              size: 16.sp,
            ),
            SizedBox(height: 8),
            MyText(
              text:
              "The application can be used free of charge for first 7 days.",
              color: Colors.white,
              size: 16.sp,
              textAlign: TextAlign.center,
            ),
            Spaces.y2,
            MyText(
              text: "https://iboproapp.com/",
              color: kOrangeColor,
              size: 16.sp,
              weight: FontWeight.bold,
            ),
            Spaces.y2,
            MyText(
              text: "Mac Address",
              color: Colors.white,
              size: 16.sp,
              textAlign: TextAlign.center,
            ),
            MyText(
              text: "11:f4:ef:08:6f:ba",
              color: kOrangeColor,
              size: 16.sp,
              textAlign: TextAlign.center,
            ),
            Spaces.y2,
            MyText(
              text: "Device key",
              color: Colors.white,
              size: 16.sp,
              textAlign: TextAlign.center,
            ),
            MyText(
              text: "1234",
              color: kOrangeColor,
              size: 16.sp,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}