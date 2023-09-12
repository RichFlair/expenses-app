import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return //transactions column
        Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: [
              //Price container
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(7),
                // price
                child: Text(
                  '\$${tx.amount}',
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 15,
                  ),
                ),
              ),
              // title and date
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    tx.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // date
                  Text(
                    DateFormat.yMMMEd().format(
                      tx.date,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
