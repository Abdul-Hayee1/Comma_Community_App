import 'package:flutter/material.dart';

class AuthController {
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  AuthController copy() {
    return AuthController()
      ..signInEmailController = signInEmailController
      ..signInPasswordController = signInPasswordController;
  }
}
