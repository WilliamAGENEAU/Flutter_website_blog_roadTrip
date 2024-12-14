import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) toggleTheme;

  const HomePage({super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.abc),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Destinations',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Van',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'À propos',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Projets',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Contact'),
            ),
          ),
          Switch(
            value: isDarkMode,
            activeColor: Theme.of(context).colorScheme.primary,
            onChanged: toggleTheme,
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
              if (states.contains(WidgetState.selected)) {
                return const Icon(Icons.nightlight_round, color: Colors.white);
              }
              return const Icon(Icons.wb_sunny, color: Colors.white);
            }),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
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
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                            ),
                            child:  Text('Voir l\'itinéraire', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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
      ),
    );
  }
}
