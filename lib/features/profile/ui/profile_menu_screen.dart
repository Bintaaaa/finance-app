import 'package:financial_app/features/profile/section/profile_menu_heading_section.dart';
import 'package:financial_app/features/profile/section/profile_menu_item_section.dart';
import 'package:flutter/material.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileMenuHeadingSection(),
            const ProfileMenuItemSection(),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: const Text("Versi: 1.8.0"),
            ),
          ],
        ),
      ),
    );
  }
}
