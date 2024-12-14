import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibo_clone/app/widgets/common_image_view_widget.dart';
import 'package:ibo_clone/app/widgets/my_text_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../const/appColors.dart';
import '../../../widgets/my_button_widget.dart';
import '../../../widgets/my_text_field_widget.dart';
import '../../../widgets/playlists.dart';
import '../../../widgets/side_pannel.dart';
import '../controllers/playlists_controller.dart';

class PlaylistsView extends GetView<PlaylistsController> {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: CommonImageView(imagePath: 'assets/images/logo.png'),
          title: MyText(
            text: 'Playlists',
            color: Colors.white,
          )),
      backgroundColor: Colors.black87,
      body: Row(
        children: [
          // Main content area
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                children: [
                  // GridView containing playlists and add button
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items per row
                        crossAxisSpacing: 2.w, // Horizontal spacing
                        mainAxisSpacing: 2.w, // Vertical spacing
                        childAspectRatio:
                        2.5, // Adjust aspect ratio for horizontal layout
                      ),
                      itemCount:
                      4, // 2 playlist items + 1 add button + 1 predefined item
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // The first grid item is the predefined container
                          return GestureDetector(
                            onTap: () {
                              // navigate
                              Get.toNamed('/demo-details');
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.music_note, color: Colors.white),
                                  MyText(
                                    text: 'Demo',
                                    color: Colors.white,
                                  ),
                                  MyText(
                                    text: 'https://github.com/',
                                    color: kOrangeColor,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (index == 3) {
                          // The last grid item is the "+" button with text
                          return GestureDetector(
                            onTap: () {
                              _showAddPlaylistDialog(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Colors.white),
                                  SizedBox(height: 1.h),
                                  MyText(
                                    text: 'Add Playlist',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Other playlist grid items
                          return GestureDetector(
                            onTap: () {
                              _showPlaylistOptionsDialog(context);
                            },
                            child: PlaylistsWidget(
                              dynamicName: 'Dynamic Name $index',
                              link: 'https://www.google.com/$index',
                              onLinkTap: () {
                                // Handle the link click
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  // Bottom text outside of GridView
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: MyText(
                      text: 'This is the text at the bottom of the screen',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Side panel on the right
          SizedBox(
            width: 200,
            child: SidePannel(),
          ),
        ],
      ),
    );
  }

  // Method to show the Add Playlist dialog
  void _showAddPlaylistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          surfaceTintColor: Colors.white,
          title: MyText(
            text: 'Add Playlist',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            // Wrap the content with SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextField(
                  hint: 'Playlist Name',
                ),
                SizedBox(height: 2.h),
                MyTextField(
                  hint: 'https://play.google.com',
                ),
              ],
            ),
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
                // Add playlist logic here
              },
              buttonText: 'Add Playlist',
            ),
          ],
        );
      },
    );
  }

  // Method to show the Playlist Options dialog with Connect, Edit, and Delete buttons
  // Method to show the Playlist Options dialog with Connect, Edit, and Delete buttons
  void _showPlaylistOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          surfaceTintColor: Colors.white,
          title: MyText(
            text: 'Playlist Options',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: 'What would you like to do with this playlist?',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            BorderButton(
              width: 10 * 2.w,
              borderColor: kOrangeColor,
              textColor: Colors.white,
              buttonText: 'Connect',
              onTap: () {
                // Connect playlist logic
                Navigator.pop(context);
              },
            ),
            BorderButton(
              width: 10 * 2.w,
              borderColor: kOrangeColor,
              textColor: Colors.white,
              buttonText: 'Edit',
              onTap: () {
                // Edit playlist logic
                Navigator.pop(context);
              },
            ),
            BorderButton(
              width: 10 * 2.w,
              borderColor: kOrangeColor,
              textColor: Colors.white,
              buttonText: 'Delete',
              onTap: () {
                // Show confirmation dialog for deletion
                Navigator.pop(context); // Close the options dialog
                _showDeleteConfirmationDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

// Method to show the Delete Confirmation dialog
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          surfaceTintColor: Colors.white,
          title: MyText(
            text: 'Confirm Deletion',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: 'Are you sure you want to delete this playlist?',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            BorderButton(
              width: 10 * 2.w,
              borderColor: kOrangeColor,
              textColor: Colors.white,
              buttonText: 'Cancel',
              onTap: () {
                Navigator.pop(context); // Close the confirmation dialog
              },
            ),
            MyButton(
              backgroundColor: kOrangeColor,
              width: 10 * 2.w,
              buttonText: 'Delete',
              onTap: () {
                // Delete playlist logic
                Navigator.pop(context); // Close the confirmation dialog
                // Add logic to delete the playlist here
              },
            ),
          ],
        );
      },
    );
  }

}