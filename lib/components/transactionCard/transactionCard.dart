// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transactions.dart';

class TransactionsCard extends StatelessWidget {
  final Transactions transaction;
  final void Function(String) onRemove;
  const TransactionsCard(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${transaction.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('dd MMM y').format(transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemove(transaction.id),
        ),
      ),
    );
  }
}
