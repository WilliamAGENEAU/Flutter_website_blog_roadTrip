import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dialog.dart';

class Pays extends StatelessWidget {
  const Pays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 5, // 5 colonnes
                crossAxisSpacing: 13.0,
                mainAxisSpacing: 13.0,
                childAspectRatio: (constraints.maxWidth / 5) / (constraints.maxHeight / 3), // Calculer le rapport largeur/hauteur des cartes
                physics: const NeverScrollableScrollPhysics(), // Désactiver le défilement
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    _buildCountryCard(context, 'Albanie', 'flags/albanie.png', 'maps/albanie_map.png'),
                    _buildCountryCard(context, 'Allemagne', 'flags/allemagne.png', 'maps/allemagne_map.png'),
                    _buildCountryCard(context, 'Autriche', 'flags/autriche.png', 'maps/autriche_map.png'),
                    _buildCountryCard(context, 'Bosnie-Herzégovine', 'flags/bosnie.png', 'maps/bosnie_map.png'),
                    _buildCountryCard(context, 'Bulgarie', 'flags/bulgarie.png', 'maps/bulgarie_map.png'),
                    _buildCountryCard(context, 'Croatie', 'flags/croatie.png', 'maps/croatie_map.png'),
                    _buildCountryCard(context, 'France', 'flags/france.png', 'maps/france_map.png'),
                    _buildCountryCard(context, 'Grèce', 'flags/grece.png', 'maps/grece_map.png'),
                    _buildCountryCard(context, 'Hongrie', 'flags/hongrie.png', 'maps/hongrie_map.png'),
                    _buildCountryCard(context, 'Italie', 'flags/italie.png', 'maps/italie_map.png'),
                    _buildCountryCard(context, 'Macédoine du Nord', 'flags/macedoine.png', 'maps/macedoine_map.png'),
                    _buildCountryCard(context, 'Monténégro', 'flags/montenegro.png', 'maps/montenegro_map.png'),
                    _buildCountryCard(context, 'Roumanie', 'flags/roumanie.png', 'maps/roumanie_map.png'),
                    _buildCountryCard(context, 'Slovénie', 'flags/slovenie.png', 'maps/slovenie_map.png'),
                    _buildCountryCard(context, 'Suisse', 'flags/suisse.png', 'maps/suisse_map.png'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCountryCard(BuildContext context, String country, String flagPath, String mapPath) {
    return StatefulBuilder(
      builder: (context, setState) {

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _showCountryDetails(context, country, flagPath, mapPath);
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(flagPath, width: 24, height: 24),
                        const SizedBox(width: 8),
                        Text(
                          country,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(mapPath, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCountryDetails(BuildContext context, String country, String flagPath, String mapPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountryDialog(country: country, flagPath: flagPath, mapPath: mapPath);
      },
    );
  }
}