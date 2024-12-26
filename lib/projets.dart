import 'package:flutter/material.dart';

class Projets extends StatelessWidget {
  const Projets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.orange.shade100,
      child: Center(
        child: Text(
          'Projets',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
