import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccsess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccsess();
      break;
    case 400:
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        title: jsonDecode(response.body)['msg'],
        btnOkOnPress: () {},
      ).show();
      break;
    case 500:
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        title: jsonDecode(response.body)['error'],
        btnOkOnPress: () {},
      ).show();
      break;
    default:
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        title: jsonDecode(response.body),
        btnOkOnPress: () {},
      ).show();
      break;
  }
}
