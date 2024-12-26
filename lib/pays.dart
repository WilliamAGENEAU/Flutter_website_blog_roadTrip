import 'package:flutter/material.dart';

class Pays extends StatelessWidget {
  const Pays({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.purple.shade100,
      child: Center(
        child: Text(
          'Pays',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
