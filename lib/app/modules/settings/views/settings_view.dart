import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibo_clone/app/const/appColors.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:sizer/sizer.dart'; // For responsive design

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsOptions = [
      {'icon': Icons.playlist_add, 'label': 'Add Playlist'},
      {'icon': Icons.lock, 'label': 'Parental Control'},
      {'icon': Icons.playlist_play, 'label': 'Change Playlist'},
      {'icon': Icons.language, 'label': 'Change Language'},
      {'icon': Icons.view_module, 'label': 'Change Layout'},
      {'icon': Icons.visibility_off, 'label': 'Hide Live Categories'},
      {'icon': Icons.visibility_off, 'label': 'Hide Vod Categories'},
      {'icon': Icons.visibility_off, 'label': 'Hide Series Categories'},
      {'icon': Icons.history, 'label': 'Clear History Channels'},
      {'icon': Icons.history, 'label': 'Clear History Movies'},
      {'icon': Icons.history, 'label': 'Clear History Series'},
      {'icon': Icons.sort, 'label': 'Live Channel Sort'},
      {'icon': Icons.tv, 'label': 'Live Stream Format'},
      {'icon': Icons.videocam, 'label': 'Change Player'},
      {'icon': Icons.open_in_new, 'label': 'External Players'},
      {'icon': Icons.settings_backup_restore, 'label': 'Automatic'},
      {'icon': Icons.access_time, 'label': 'Time Format'},
      {'icon': Icons.subtitles, 'label': 'Subtitle Settings'},
      {'icon': Icons.devices, 'label': 'Select Device Type'},
      {'icon': Icons.update, 'label': 'Update Now'},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: MyText(
          text: 'Settings',
          weight: FontWeight.w500,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Four columns as in the image
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: 1.h,
                  childAspectRatio: 1.h, // Adjust for grid proportions
                ),
                itemCount: settingsOptions.length,
                itemBuilder: (context, index) {
                  final option = settingsOptions[index];
                  return _buildSettingsOption(
                    icon: option['icon'],
                    label: option['label'],
                    onTap: () {
                      // Action for each button
                      print('${option['label']} tapped');
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Mac Address: 11:f4:ef:08:6f:ba',
                color: Colors.white, size: 14.sp),

                  MyText(
                    text:'Device Key: 278281',
                    color: Colors.white, size: 14.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kOrangeColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18.sp),
            SizedBox(height: 1.h),
            MyText(
              text: label,
              textAlign: TextAlign.center,
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