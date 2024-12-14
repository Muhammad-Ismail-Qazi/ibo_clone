import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibo_clone/app/const/appColors.dart';
import 'package:ibo_clone/app/widgets/hide_live_categories.dart';
import 'package:ibo_clone/app/widgets/hide_series_categories.dart';
import 'package:ibo_clone/app/widgets/live_channel_sort.dart';
import 'package:ibo_clone/app/widgets/my_button_widget.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:ibo_clone/app/widgets/select_language.dart';
import 'package:sizer/sizer.dart'; // For responsive design

import '../../../const/spaces.dart';
import '../../../widgets/add_playlist_dialog.dart';
import '../../../widgets/hide_vode_categorie.dart';
import '../../../widgets/layout.dart';
import '../../../widgets/parantal_control.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsOptions = [
      {'icon': Icons.playlist_add, 'label': 'Add Playlist', 'onTap': () => _showAddPlaylistDialog(context)},
      {'icon': Icons.lock, 'label': 'Parental Control', 'onTap': () => _showParentalControlDialog(context)},
      {'icon': Icons.playlist_play, 'label': 'Change Playlist', 'onTap': () => Get.toNamed('/playlists')},
      {'icon': Icons.language, 'label': 'Change Language', 'onTap': () => _showChangeLanguageDialog(context)},
      {'icon': Icons.view_module, 'label': 'Change Layout', 'onTap': () => _showLayoutDialog(context)},
      {'icon': Icons.visibility_off, 'label': 'Hide Live Categories', 'onTap': () => _showHideCategoriesDialog(context, 'Live Categories')},
      {'icon': Icons.visibility_off, 'label': 'Hide Vod Categories', 'onTap': () => _showVodCategoriesDialog(context, 'VOD Categories')},
      {'icon': Icons.visibility_off, 'label': 'Hide Series Categories', 'onTap': () => _showSeriesCategoriesDialog(context, 'Series Categories')},
      {'icon': Icons.sort, 'label': 'Live Channel Sort', 'onTap': () => _showLiveChannelSortDialog(context)},
      {'icon': Icons.history, 'label': 'Clear History Channels', 'onTap': () => Get.snackbar('Clear History', 'Channels history cleared!')},
      {'icon': Icons.history, 'label': 'Clear History Movies', 'onTap': () => Get.snackbar('Clear History', 'Movies history cleared!')},
      {'icon': Icons.history, 'label': 'Clear History Series', 'onTap': () => Get.snackbar('Clear History', 'Series history cleared!')},
      {'icon': Icons.settings_backup_restore, 'label': 'Automatic', 'onTap': () => Get.snackbar('Automatic', 'Settings updated automatically!')},
      {'icon': Icons.access_time, 'label': 'Time Format', 'onTap': () => Get.snackbar('Time Format', 'Updated to 24-hour format!')},
      {'icon': Icons.subtitles, 'label': 'Subtitle Settings', 'onTap': () => Get.toNamed('/subtitleSettings')},
      {'icon': Icons.devices, 'label': 'Select Device Type', 'onTap': () => Get.toNamed('/selectDeviceType')},
      {'icon': Icons.update, 'label': 'Update Now', 'onTap': () => Get.snackbar('Update', 'Application is up to date!')},
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
                  crossAxisCount: 4, // Four columns
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
                    onTap: option['onTap'],
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
                      color: Colors.white,
                      size: 14.sp),
                  MyText(
                    text: 'Device Key: 278281',
                    color: Colors.white,
                    size: 14.sp,
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

  void _showAddPlaylistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddPlaylistDialog(),
    );
  }

  void _showParentalControlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ParantalControl(),
    );
  }

  void _showChangeLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SelectLanguage(),
    );
  }

  void _showLayoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Selectlayout()
    );
  }

  void _showHideCategoriesDialog(BuildContext context, String categoryType) {
    showDialog(
      context: context,
      builder: (context) =>HideLiveCategories(),
    );
  }

  void _showVodCategoriesDialog(BuildContext context, String categoryType) {
    showDialog(
      context: context,
      builder: (context) =>HideVodeCategories(),
    );
  }

  void _showSeriesCategoriesDialog(BuildContext context, String categoryType) {
    showDialog(
      context: context,
      builder: (context) =>HideSeriesCategories(),
    );
  }

  void _showLiveChannelSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => LiveChannelSort(),
    );
  }
}