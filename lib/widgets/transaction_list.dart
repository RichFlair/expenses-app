import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_tracker/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    //transactions column
    return transactions.isEmpty
        ? Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'There are no transactions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.contain,
              ),
            ],
          )
        : Column(
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
                          color: Theme.of(context).primaryColorDark,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(7),
                      // price
                      child: Text(
                        '\$${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
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
                        Text(tx.title,
                            style: Theme.of(context).textTheme.titleMedium),
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
