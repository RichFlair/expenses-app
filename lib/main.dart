import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_tracker/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Sneakers',
      amount: 20.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shirts',
      amount: 10.59,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: const Text('CHARTS'),
            ),
          ),
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
          ),
        ],
      ),
    );
  }
}
