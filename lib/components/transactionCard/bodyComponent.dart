// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BodyComponent extends StatelessWidget {
  final String title;
  final DateTime date;

  BodyComponent({
    required this.title,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
        ),
        Text(
          DateFormat('dd MMM yyyy').format(date),
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
