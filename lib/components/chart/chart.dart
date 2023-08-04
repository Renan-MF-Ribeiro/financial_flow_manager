import 'package:financial_flow_manager/components/chart/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transactions.dart';

class Chart extends StatelessWidget {
  Chart(this.lastTransactions);

  final List<Transactions> lastTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (var tr in lastTransactions) {
        if (DateFormat('dd MMM yyyy').format(tr.date) ==
            DateFormat('dd MMM yyyy').format(weekDay)) {
          totalSum += tr.value;
        }
      }
      final r = {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
      return r;
    }).reversed.toList();
  }

  double percentage(double value) {
    double total = lastTransactions.length == 0
        ? 0
        : lastTransactions.map((data) => data.value).reduce((a, b) => a + b);

    // Calcula a porcentagem do valor alvo em relação ao total
    double percentage = total == 0 ? 0 : (value / total);

    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map(
            (tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    tr['day'] as String,
                    tr['value'] as double,
                    percentage(
                      tr['value'] as double,
                    )),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
