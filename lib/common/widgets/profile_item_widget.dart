import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const ProfileItemWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.06),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Icon(
                icon,
                color: Colors.black26,
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
