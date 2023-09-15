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
        Text('\$${price.toStringAsFixed(0)}'),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageOfPrice,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(225, 225, 225, 1),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
