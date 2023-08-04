// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ValueComponent extends StatelessWidget {
  final double value;
  ValueComponent(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(
        10,
      ),
      child: Text(
        "R\$ ${value.toStringAsFixed(2)}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
