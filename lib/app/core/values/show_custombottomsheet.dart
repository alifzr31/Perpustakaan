import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/colors.dart';

void showCustomBottomSheet(double height, Widget content) {
  Get.bottomSheet(
    elevation: 3,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: creamColor,
    SizedBox(
      width: Get.width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: content,
      ),
    ),
  );
}