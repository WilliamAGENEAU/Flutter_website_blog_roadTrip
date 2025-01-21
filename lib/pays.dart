import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Pays extends StatefulWidget {
  const Pays({super.key});

  @override
  _PaysState createState() => _PaysState();
}

class _PaysState extends State<Pays> {
  late Map<String, Map<String, String>> countryInfo;

  @override
  void initState() {
    super.initState();
    _loadCountryInfo();
  }

  void _loadCountryInfo() {
    setState(() {
      countryInfo = {
        'Albanie': {
          'capitale': 'Tirana',
          'monnaie': 'Lek (ALL)',
          'langue': 'Albanais',
          'camping': 'Autorise',
          'vignette': 'Non requis',
        },
        'Allemagne': {
          'capitale': 'Berlin',
          'monnaie': 'Euro (EUR)',
          'langue': 'Allemand',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Autriche': {
          'capitale': 'Vienne',
          'monnaie': 'Euro (EUR)',
          'langue': 'Allemand',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Bosnie-Herzegovine': {
          'capitale': 'Sarajevo',
          'monnaie': 'Mark convertible (BAM)',
          'langue': 'Bosnien',
          'camping': 'Autorise',
          'vignette': 'Non requis',
        },
        'Bulgarie': {
          'capitale': 'Sofia',
          'monnaie': 'Lev (BGN)',
          'langue': 'Bulgare',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Croatie': {
          'capitale': 'Zagreb',
          'monnaie': 'Kuna (HRK)',
          'langue': 'Croate',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'France': {
          'capitale': 'Paris',
          'monnaie': 'Euro (EUR)',
          'langue': 'Francais',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Grece': {
          'capitale': 'Athenes',
          'monnaie': 'Euro (EUR)',
          'langue': 'Grec',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Hongrie': {
          'capitale': 'Budapest',
          'monnaie': 'Forint (HUF)',
          'langue': 'Hongrois',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Italie': {
          'capitale': 'Rome',
          'monnaie': 'Euro (EUR)',
          'langue': 'Italien',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Macedoine du Nord': {
          'capitale': 'Skopje',
          'monnaie': 'Denar (MKD)',
          'langue': 'Macedonien',
          'camping': 'Autorise',
          'vignette': 'Non requis',
        },
        'Montenegro': {
          'capitale': 'Podgorica',
          'monnaie': 'Euro (EUR)',
          'langue': 'Montenegrin',
          'camping': 'Autorise',
          'vignette': 'Non requis',
        },
        'Roumanie': {
          'capitale': 'Bucarest',
          'monnaie': 'Leu (RON)',
          'langue': 'Roumain',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Slovenie': {
          'capitale': 'Ljubljana',
          'monnaie': 'Euro (EUR)',
          'langue': 'Slovene',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
        'Suisse': {
          'capitale': 'Berne',
          'monnaie': 'Franc suisse (CHF)',
          'langue': 'Francais, Allemand, Italien, Romanche',
          'camping': 'Autorise',
          'vignette': 'Requis',
        },
      };
    });
  }

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
                  children: countryInfo.keys.map((country) {
                    return _buildCountryCard(
                      context,
                      country,
                      'flags/${country.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_')}.png',
                      'maps/${country.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_')}_map.png',
                      countryInfo[country]!['capitale']!,
                      countryInfo[country]!['monnaie']!,
                      countryInfo[country]!['langue']!,
                      countryInfo[country]!['camping']!,
                      countryInfo[country]!['vignette']!,
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCountryCard(BuildContext context, String country, String flagPath, String mapPath, String capitale, String monnaie, String langue, String camping, String vignette) {
    return Card(
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
    );
  }
}