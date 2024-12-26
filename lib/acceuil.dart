import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  final VoidCallback scrollToDestinations;

  const Acceuil({super.key, required this.scrollToDestinations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "L'histoire d'un van, d'un rêve\net de la liberté à travers les Balkans",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Entre paysages, rencontres et vie nomade, explorez notre aventure à travers une carte et des anecdotes.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: scrollToDestinations,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24.0)),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Voir l\'itinéraire',
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'images/homepage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
