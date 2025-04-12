// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:io';

import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileModal extends ConsumerStatefulWidget {
  const EditProfileModal({super.key});

  @override
  EditProfileModalState createState() => EditProfileModalState();
}

class EditProfileModalState extends ConsumerState<EditProfileModal> {
  final TextEditingController miniBioController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();
  late ProfileController profileController;
  late ProfileNotifier profileNotifier;

  @override
  void initState() {
    super.initState();

    miniBioController.addListener(() {
      setState(() {});
    });

    aboutMeController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    miniBioController.dispose();
    aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    profileController = ref.watch(profileNotifierProvider);
    profileNotifier = ref.read(profileNotifierProvider.notifier);
    return WillPopScope(
      onWillPop: () async {
        profileNotifier.clearUserSelectedImage();
        return true;
      },
      child: FractionallySizedBox(
        heightFactor: 0.93,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        profileNotifier.clearUserSelectedImage();
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      profileNotifier.saveImage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(40, 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logos/cover.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -50),
                      child: GestureDetector(
                        onTap: () {
                          showSelectProfileModelSheet(context, ref);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          child: profileController.userSelectedImage != null
                              ? CircleAvatar(
                                  radius: 90,
                                  backgroundImage: FileImage(
                                    File(profileController
                                        .userSelectedImage!.path),
                                  ))
                              : profileController.profileImagePath.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 90,
                                      backgroundImage: FileImage(
                                        File(
                                            profileController.profileImagePath),
                                      ),
                                    )
                                  : FutureBuilder<File?>(
                                      future: profileNotifier.getProfileImage(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData &&
                                            snapshot.data != null) {
                                          return CircleAvatar(
                                            backgroundImage:
                                                FileImage(snapshot.data!),
                                            radius: 90,
                                          );
                                        }
                                        return CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              profileController.photoUrl),
                                          radius: 90,
                                        );
                                      },
                                    ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'First Name',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 100.w),
                              const Text(
                                'Last Name',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: profileController
                                      .editProfileFirstNameController,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 59, 76, 170),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'First Name',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[350]),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: profileController
                                      .editProfileLastNameController,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 59, 76, 170),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Last Name',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Mini-Bio',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          buildTextField(
                              'Share a quick, memorable headline about yourself',
                              160,
                              miniBioController),
                          const SizedBox(height: 20),
                          const Text(
                            'About Me',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          buildTextField(
                              "Add an introduction with your goals and interests...",
                              500,
                              aboutMeController),
                          const Text(
                            'Profession',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Personal Links',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
    String hintText, int maxLength, TextEditingController controller) {
  return TextField(
    controller: controller,
    maxLines: 3,
    maxLength: maxLength,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey[350],
        fontWeight: FontWeight.normal,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 59, 76, 170),
          width: 2.0,
        ),
      ),
      filled: true,
      fillColor: Colors.transparent,
      counterText: "${maxLength - controller.text.length}",
      counterStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  );
}
