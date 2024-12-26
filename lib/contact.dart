import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red.shade100,
      child: Center(
        child: Text(
          'Contact',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
