import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({super.key, required this.addTx});

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
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
