import 'dart:io';
import 'package:flutter/material.dart';

class ProfileController {
  String userName = "...";
  String userEmail = "...";
  String firstName = "";
  String lastName = "";
  String photoUrl = "https://randomuser.me/api/portraits/men/1.jpg";
  TextEditingController editProfileFirstNameController =
      TextEditingController();
  TextEditingController editProfileLastNameController = TextEditingController();
  File? userSelectedImage;
  String profileImagePath = "";
  bool isProfileUploading = false;
  TextEditingController miniBioController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  var userDetails;

  ProfileController copy() {
    return ProfileController()
      ..userName = userName
      ..userEmail = userEmail
      ..photoUrl = photoUrl
      ..firstName = firstName
      ..lastName = lastName
      ..editProfileFirstNameController = editProfileFirstNameController
      ..editProfileLastNameController = editProfileLastNameController
      ..userSelectedImage = userSelectedImage
      ..isProfileUploading = isProfileUploading
      ..profileImagePath = profileImagePath
      ..miniBioController = miniBioController
      ..aboutMeController = aboutMeController
      ..userDetails = userDetails;
  }
}
