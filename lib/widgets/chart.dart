import 'package:flutter/material.dart';

import 'package:expenses_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({
    super.key,
    required this.recentTransaction,
  });

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        var totalSum = 0.0;

        for (var i = 0; i <= recentTransaction.length; i++) {
          if (weekday.day == recentTransaction[i].date.day &&
              weekday.month == recentTransaction[i].date.month &&
              weekday.year == recentTransaction[i].date.year) {
            totalSum += recentTransaction[i].amount;
          }
        }

        print(DateFormat.E(weekday));
        print(totalSum);

        return {'Day': DateFormat.E(weekday), 'amount': totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
