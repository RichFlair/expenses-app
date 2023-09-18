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
    return SizedBox(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'There are no transactions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                      title: Text(transactions[index].title,
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].date),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
                // Card(
                //   child: Row(
                //     children: [
                //       //Price container
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 15,
                //           horizontal: 20,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColorDark,
                //             style: BorderStyle.solid,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(7),
                //         // price
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColorDark,
                //             fontSize: 15,
                //           ),
                //         ),
                //       ),
                //       // title and date
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           // title
                //           Text(transactions[index].title,
                //               style: Theme.of(context).textTheme.titleMedium),
                //           // date
                //           Text(
                //             DateFormat.yMMMEd().format(
                //               transactions[index].date,
                //             ),
                //             style: const TextStyle(
                //               color: Colors.grey,
                //               fontSize: 12,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
