import 'package:flutter/material.dart';

class Van extends StatelessWidget {
  const Van({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.yellow.shade100,
      child: Center(
        child: Text(
          'Van',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
