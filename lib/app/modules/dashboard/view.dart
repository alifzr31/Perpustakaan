import 'package:flutter/material.dart';
import 'package:perpustakaan/app/modules/dashboard/components/bottom_nav.dart';
import 'package:perpustakaan/app/modules/dashboard/components/tab_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabPage(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
