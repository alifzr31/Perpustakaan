import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/modules/buku/widgets/index.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: greenColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            IndexBukuPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenColor,
        foregroundColor: orangeColor,
        onPressed: () {
          Get.toNamed('/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
