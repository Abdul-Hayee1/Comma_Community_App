// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> sendNotification(String messageContent,
    {String? userId}) async {
  const String heading = "Inviti";
  final dio = Dio()
    ..interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));

  final Map<String, dynamic> data = {
    'app_id': '3a90fe4c-b4a5-400d-819a-7e3edcbcb571',
    'headings': {'en': heading},
    'contents': {'en': messageContent},
  };

  if (userId != null) {
    data['filters'] = [
      {
        "field": "tag",
        "key": "user_id",
        "relation": "=",
        "value": userId,
      }
    ];
  } else {
    data['filters'] = [
      {
        "field": "tag",
        "key": "platform",
        "relation": "=",
        "value": "mobile",
      }
    ];
  }

  try {
    final response = await dio.post(
      'https://onesignal.com/api/v1/notifications',
      data: jsonEncode(data),
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              'Basic os_v2_app_hkip4tfuuvaa3am2py7nzpfvofw6knmrfd7uaentdywl544fwg2owlckcxvswpbhjoxfok3nne5xw2qnxgnhzqwq2fs3jhtqoycawoi',
        },
      ),
    );

    return response.data;
  } on DioException catch (e) {
    if (e.response != null) {
      throw Exception('OneSignal API Error: ${e.response?.data}');
    } else {
      throw Exception('Failed to send notification: ${e.message}');
    }
  }
}
