// ignore_for_file: unused_import

import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showExceptionAlertDialog({
  required String title,
  required dynamic exception,
  required BuildContext context,
}) async {
  await showAlertDialog(
    title: title,
    content: _message(exception),
    defaultActionText: "Okay",
    context: context,
  );
}

String _message(dynamic exception) {
  if (exception is PlatformException) {
    return exception.message ?? exception.toString();
  }
  return exception.toString();
}

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  required String defaultActionText,
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: AlertDialog(
          backgroundColor: const Color(0xff042759),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          content: content != null
              ? Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              : null,
          actions: <Widget>[
            if (cancelActionText != null)
              TextButton(
                child: Text(cancelActionText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            TextButton(
              child: Text(
                defaultActionText,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(
              cancelActionText,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(
            defaultActionText,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}
