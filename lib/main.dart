// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:financial_flow_manager/components/formTransaction/formTransaction.dart';
import 'package:flutter/material.dart';
import 'components/chart/chart.dart';
import 'components/transactionsList/transactionsList.dart';
import 'models/transactions.dart';

main() => runApp(FinancialApp());

class FinancialApp extends StatelessWidget {
  FinancialApp({super.key});
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.green,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transactions> _transactions = [];

  List<Transactions> get _lastTransactions {
    return _transactions
        .where(
          (tr) => tr.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  addTransaction(String title, double value, DateTime? date) {
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date != null ? date! : DateTime(2000, 1, 1, 00, 00),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador Financeiro'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_lastTransactions),
            TransactionsList(_transactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
