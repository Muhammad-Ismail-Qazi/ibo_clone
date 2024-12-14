import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../const/appColors.dart';
import '../controllers/demo_details_controller.dart';

class DemoDetailsView extends GetView<DemoDetailsController> {
  const DemoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            // Playlist expiration section styled as a button-like tile
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Container(
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kOrangeColor, width: 1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 5.h,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        'Current playlist expires: unlimited',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Button grid
            Expanded(

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.w,
                  childAspectRatio: 0.9.h,
                  children: [
                    _buildCustomContainer(
                      icon: Icons.live_tv,
                      label: 'Live',
                      onPressed: () {},
                      color: kOrangeColor,
                    ),
                    _buildCustomContainer(
                      icon: Icons.movie,
                      label: 'Movies',
                      onPressed: () {},
                      color: Colors.red,
                    ),
                    _buildCustomContainer(
                      icon: Icons.video_library,
                      label: 'Series',
                      onPressed: () {},
                      color: Colors.deepPurple,
                    ),
                    _buildCustomContainer(
                      icon: Icons.account_circle,
                      label: 'Account',
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                    _buildCustomContainer(
                      icon: Icons.playlist_add,
                      label: 'Change Playlist',
                      onPressed: () {},
                      color: Colors.green,
                    ),
                    _buildCustomContainer(
                      icon: Icons.settings,
                      label: 'Settings',
                      onPressed: () {
                        Get.toNamed('/settings');
                      },
                      color: Colors.grey,
                    ),
                    _buildCustomContainer(
                      icon: Icons.refresh,
                      label: 'Reload',
                      onPressed: () {},
                      color: Colors.cyan,
                    ),
                    _buildCustomContainer(
                      icon: Icons.exit_to_app,
                      label: 'Exit',
                      onPressed: () {},
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomContainer({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24.sp),
            SizedBox(height: 1.h),
            MyText(
              text:label,

                color: Colors.white,
                size: 14.sp,
                weight: FontWeight.w500,

            ),
          ],
        ),
      ),
    );
  }
}