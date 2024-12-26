import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.green.shade100,
      child: Center(
        child: Text(
          'À propos',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
