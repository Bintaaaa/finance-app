import 'package:financial_app/common/constants/constans_values.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          color: Colors.amber,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Selamat Siang",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bijantium",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 16.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Badge(
                    label: Text("1"),
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(
                        ConstansValues.routeName.profileMenu,
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text("T"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
