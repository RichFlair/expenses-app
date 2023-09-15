import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({
    super.key,
    required this.addTx,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return // input card
        Card(
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // title
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (value) => submitData(),
            ),
            // amount
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              onSubmitted: (value) => submitData(),
            ),
            // add transaction
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
