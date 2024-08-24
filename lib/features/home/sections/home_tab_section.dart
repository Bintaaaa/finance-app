import 'package:flutter/material.dart';

class HomeTabSection extends StatelessWidget {
  const HomeTabSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.08),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Text(
                "Payuung Pribadi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: Text(
              "Payuung Karyawan",
              style: TextStyle(
                color: Colors.black12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
