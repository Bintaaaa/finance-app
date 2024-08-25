import 'package:financial_app/common/widgets/bottom_navigation_expended_widget.dart';
import 'package:financial_app/data/home/models/home_item_model.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationSection extends StatelessWidget {
  const HomeBottomNavigationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationExpandedWidget(
      child: GridView.builder(
        itemCount: bottomNavItems.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisExtent: 90,
        ),
        itemBuilder: (context, index) => Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            bottomNavItems[index].icon!,
            Text(bottomNavItems[index].title),
          ],
        ),
      ),
    );
  }
}
