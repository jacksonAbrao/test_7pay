import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    _showSnackBar(
      AwesomeSnackbarContent(
        title: 'Erro',
        message: message,
        color: Colors.red,
        contentType: ContentType.failure,
      ),
    );
  }

  void _showSnackBar(AwesomeSnackbarContent content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 70),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
