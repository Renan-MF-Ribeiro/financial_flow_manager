import 'package:flutter/material.dart';

import '../../models/transactions.dart';
import '../transactionCard/transactionCard.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;
  final void Function(String) onRemove;
  const TransactionsList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 0.0,
                  ),
                  child: Text(
                    'Nenhuma transação encontrada',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return TransactionsCard(transactions[index], onRemove);
              },
            ),
    );
  }
}
