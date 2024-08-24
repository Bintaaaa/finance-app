import 'package:financial_app/features/home/sections/home_botom_navigation_section.dart';
import 'package:financial_app/features/home/sections/home_category_section.dart';
import 'package:financial_app/features/home/sections/home_finance_section.dart';
import 'package:financial_app/features/home/sections/home_header_section.dart';
import 'package:financial_app/features/home/sections/home_tab_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 90),
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                width: double.infinity,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeTabSection(),
                    SizedBox(
                      height: 16,
                    ),
                    HomeFinanceSection(),
                    SizedBox(
                      height: 16,
                    ),
                    HomeCategorySection(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            const HomeBottomNavigationSection(),
            const HomeHeaderSection(),
          ],
        ),
      ),
    );
  }
}
