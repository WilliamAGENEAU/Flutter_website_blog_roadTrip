import 'package:flutter/material.dart';

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
            return GridView.count(
              crossAxisCount: 5, // 5 colonnes
              crossAxisSpacing: 13.0,
              mainAxisSpacing: 13.0,
              childAspectRatio: (constraints.maxWidth / 5) / (constraints.maxHeight / 3), // Calculer le rapport largeur/hauteur des cartes
              physics: const NeverScrollableScrollPhysics(), // Désactiver le défilement
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildCountryCard(BuildContext context, String country, String flagPath, String mapPath) {
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
  }

  void _showCountryDetails(BuildContext context, String country, String flagPath, String mapPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).colorScheme.background,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(flagPath, width: 40, height: 40),
                        const SizedBox(width: 16),
                        Text(country, style: Theme.of(context).textTheme.headlineMedium),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection("Capitale", "Exemple Capitale"),
                    _buildInfoSection("Monnaie", "Exemple Monnaie"),
                    _buildInfoSection("Langue parlée/officielle", "Exemple Langue"),
                    _buildInfoSection("Camping sauvage", "Autorisé"),
                    _buildInfoSection("Vignette et autoroute", "Obligatoire"),
                    _buildInfoSection("Membre de l'UE", "Oui"),
                    _buildInfoSection("Eau du robinet potable", "Non"),
                    _buildInfoSection("Prix de l'essence", "1.50€/L"),
                    _buildInfoSection("Forfait téléphone", "Inclut en Europe"),
                    _buildInfoSection("Plateforme pour dormir chez l'habitant", "Exemple Plateforme"),
                    _buildInfoSection("Période vacances scolaires", "Exemple Période"),
                    _buildInfoSection("Spot de surf", "Exemple Spot"),
                    _buildInfoSection("Sens de circulation", "Droite"),
                    _buildInfoSection("Règle obligation équipement véhicule", "Pneus neige obligatoires"),
                    const SizedBox(height: 16),
                    Text("Carte du pays", style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Image.asset(mapPath, fit: BoxFit.cover),
                    const SizedBox(height: 16),
                    Text("Plats typiques à tester", style: Theme.of(context).textTheme.headlineSmall),
                    _buildInfoSection("", "Exemple Plat 1, Exemple Plat 2"),
                    const SizedBox(height: 16),
                    Text("Mots usuels", style: Theme.of(context).textTheme.headlineSmall),
                    _buildInfoSection("", "Bonjour, Merci, Oui, Non"),
                    const SizedBox(height: 16),
                    Text("Météo selon mois de l'année", style: Theme.of(context).textTheme.headlineSmall),
                    _buildInfoSection("", "Janvier : Froid, Février : Froid, ..."),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text("$title : ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }
}
