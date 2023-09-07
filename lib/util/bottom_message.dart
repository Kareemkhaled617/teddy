import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar bottomMessage(
    {required String title,
    required String message,
    required ContentType type}) {
  return SnackBar(
    elevation: 4,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: type,
    ),
  );
}
