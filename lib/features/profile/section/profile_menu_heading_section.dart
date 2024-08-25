import 'package:flutter/material.dart';

class ProfileMenuHeadingSection extends StatelessWidget {
  const ProfileMenuHeadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        16.0,
      ),
      child: Row(
        children: [
          const Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: CircleAvatar(
                  child: Text("T"),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.camera_alt,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16.0,
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 12.0,
            children: [
              Text(
                "Bijantium",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Text("Masuk Reguler dengan email"),
            ],
          )
        ],
      ),
    );
  }
}
