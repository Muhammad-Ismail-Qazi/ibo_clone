import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibo_clone/app/widgets/common_image_view_widget.dart';
import 'package:ibo_clone/app/widgets/my_button_widget.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../const/appColors.dart';
import '../../../const/spaces.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: CommonImageView(
                imagePath: 'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),

            // Black mask with opacity
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
              ),
            ),

            // Main content
            Positioned.fill(
              child: Row(
                children: [
                  // Left side: Centered text and buttons
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(  // Make left side scrollable
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            text: 'Your subscription is remaining 6 days',
                            color: Colors.white,
                            weight: FontWeight.w500,
                          ),
                          Spaces.y3,
                          MyText(
                            textAlign: TextAlign.center,
                            text: 'You have not uploaded your playlist, continue with our demo.',
                            color: Colors.white,
                          ),
                          Spaces.y2,
                          MyText(
                            text: 'https://www.youtube.com/watch',
                            color: kOrangeColor,
                            weight: FontWeight.w500,
                          ),
                          Spaces.y2,
                          MyText(
                            text: 'Mac Address',
                            color: Colors.white,
                          ),
                          Spaces.y1,
                          MyText(
                            text: '11:23:fa:ff:ff:ff',
                            color: kOrangeColor,
                            weight: FontWeight.w500,
                          ),
                          Spaces.y2,
                          MyText(
                            text: 'Device key',
                            color: Colors.white,
                          ),
                          Spaces.y1,
                          MyText(
                            text: '12345',
                            color: kOrangeColor,
                            weight: FontWeight.w500,
                          ),
                          Spaces.y1,
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                backgroundColor: kOrangeColor,
                                width: 12.w,
                                height: 10.h,
                                buttonText: 'Continue',
                                onTap: () {
                                  Get.toNamed('/playlists');
                                },
                              ),
                              const SizedBox(width: 16),
                              BorderButton(
                                width: 12.w,
                                height: 10.h,
                                textColor: Colors.white,
                                borderColor: kOrangeColor,
                                buttonText: 'Cancel',
                                onTap: () {
                                  // Add action here
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right side: Column with two images and text
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(  // Make right side scrollable as well
                      child: Column(
                        children: [
                          CommonImageView(
                            imagePath: 'assets/images/logo.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(height: 16),
                          CommonImageView(
                            imagePath: 'assets/images/bg.png', // Replace with actual image path
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(height: 16),
                          MyText(
                            text: 'Some description or title here',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}