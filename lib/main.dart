import 'package:flutter/material.dart';

import 'package:expenses_tracker/widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // charts
            Card(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                child: const Text('CHARTS'),
              ),
            ),
            const UserTransactions(),
          ],
        ),
      ),
    );
  }
}
