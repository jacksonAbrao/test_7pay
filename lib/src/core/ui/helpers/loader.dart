import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  bool isOpen = false;

  void startLoading() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void stopLoading() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    stopLoading();
    super.dispose();
  }
}
