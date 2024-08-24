import 'package:flutter/material.dart';

class HomeSectionWidget extends StatelessWidget {
  final String sectionTitle;
  final SliverGridDelegate gridDelegate;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const HomeSectionWidget({
    super.key,
    required this.sectionTitle,
    required this.gridDelegate,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: gridDelegate,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
