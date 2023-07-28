import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:perpustakaan/app/core/values/colors.dart';

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (context) {
      return LoadingAnimationWidget.flickr(
        leftDotColor: greenColor,
        rightDotColor: orangeColor,
        size: 100,
      );
    },
  );
}
