import 'package:flutter/material.dart';

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
      amount: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shirts',
      amount: 10,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: const Text('CHARTS'),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Text(tx.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
