import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController {
  String userName = "...";
  String userEmail = "...";
  String firstName = "";
  String lastName = "";
  String photoUrl = "https://randomuser.me/api/portraits/men/1.jpg";
  TextEditingController editProfileFirstNameController =
      TextEditingController();
  TextEditingController editProfileLastNameController = TextEditingController();
  XFile? userSelectedImage;

  ProfileController copy() {
    return ProfileController()
      ..userName = userName
      ..userEmail = userEmail
      ..photoUrl = photoUrl
      ..firstName = firstName
      ..lastName = lastName
      ..editProfileFirstNameController = editProfileFirstNameController
      ..editProfileLastNameController = editProfileLastNameController
      ..userSelectedImage = userSelectedImage;
  }
}
