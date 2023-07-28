import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var isLoading = true;
  String? token;

  @override
  void initState() {
    Timer(const Duration(seconds: 4), navigator);
    super.initState();
  }

  void navigator() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');

    if (token == null) {
      setState(() {
        isLoading = false;
      });
    } else {
      Get.offAllNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/perpus1.png'),
                const Text(
                  'Aplikasi Perpustakaan',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: greenColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            height: 50,
            width: isLoading ? 90 : Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: orangeColor,
                shape: isLoading
                    ? const CircleBorder()
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
              ),
              onPressed: () {
                isLoading ? null : Get.offAndToNamed('/auth');
              },
              child: isLoading
                  ? const CircularProgressIndicator(color: orangeColor)
                  : const Text(
                      'Get Started',
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
