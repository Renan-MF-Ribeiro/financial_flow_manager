import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar(this.title, this.value, this.percentage);

  final String title;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          margin: EdgeInsets.all(2),
          child: FittedBox(
            child: Text(
              'R\$${value.toStringAsFixed(2)}',
            ),
          ),
        ),
        const SizedBox(
          height: 5,
          child: null,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(title),
      ],
    );
  }
}
