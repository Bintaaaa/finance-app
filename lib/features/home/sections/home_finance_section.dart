import 'package:financial_app/common/widgets/home_item_widget.dart';
import 'package:financial_app/data/home/models/home_item_model.dart';
import 'package:flutter/material.dart';

class HomeFinanceSection extends StatelessWidget {
  const HomeFinanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeSectionWidget(
      sectionTitle: "Produk Keuangan",
      itemCount: financeProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 100,
      ),
      itemBuilder: (context, index) => SizedBox(
        child: Column(
          children: [
            Image.asset(
              financeProducts[index].imagePath!,
              width: 55,
              height: 50,
              fit: BoxFit.cover,
            ),
            Text(
              financeProducts[index].title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
