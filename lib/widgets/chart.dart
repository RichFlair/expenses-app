import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_tracker/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({
    super.key,
    required this.recentTransaction,
  });

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
          children: groupedTransactionValue.map((e) {
        return Text('${e['day']}: ${e['amount']}');
      }).toList()),
    );
  }
}
