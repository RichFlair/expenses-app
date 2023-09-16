import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double price;
  final double percentageOfPrice;
  const ChartBar({
    super.key,
    required this.label,
    required this.price,
    required this.percentageOfPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$$price'),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(220, 220, 220, 1),
              ),
            ),
            FractionallySizedBox(
              heightFactor: percentageOfPrice,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
