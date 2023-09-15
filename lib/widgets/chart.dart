import 'package:expenses_tracker/widgets/chart_bar.dart';
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

        return {
          'Day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': totalSum,
        };
      },
    );
  }

  double get overallSpending {
    return groupedTransactionValue.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
          children: groupedTransactionValue.map((e) {
        return ChartBar(
          label: (e['Day']).toString(),
          price: (e['amount'] as double),
          percentageOfPrice: overallSpending == 0.0
              ? 0.0
              : ((e['amount'] as double) / overallSpending),
        );
      }).toList()),
    );
  }
}
