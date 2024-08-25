import 'package:financial_app/common/extensions/comparated_value.dart';
import 'package:financial_app/common/widgets/profile_item_widget.dart';
import 'package:financial_app/data/profile/models/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenuItemSection extends StatelessWidget {
  const ProfileMenuItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: profileMenus.length,
      itemBuilder: (context, index) {
        final item = profileMenus[index];
        return ProfileItemWidget(
          title: item.title,
          icon: item.icon,
          onTap: () {
            final path = item.path;
            if (path.isNotNull()) {
              context.pushNamed(path!);
            }
          },
        );
      },
    );
  }
}
