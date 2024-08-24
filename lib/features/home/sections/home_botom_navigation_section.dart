import 'package:financial_app/common/widgets/bottom_navigation_expended_widget.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationSection extends StatelessWidget {
  const HomeBottomNavigationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationExpandedWidget(
      child: GridView.builder(
        itemCount: 7,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 85,
          mainAxisExtent: 85,
        ),
        itemBuilder: (context, index) => const Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 32,
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
