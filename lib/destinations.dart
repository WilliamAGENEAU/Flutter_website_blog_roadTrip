import 'package:flutter/material.dart';

class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Assurez-vous que ce container a suffisamment de hauteur pour permettre le défilement
      color: Colors.blue.shade100,
      child: Center(
        child: Text(
          'Destinations',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
