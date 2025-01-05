import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dialog.dart';

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

  Future<void> _loadCountryInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      countryInfo = {
        'Albanie': {
          'capitale': prefs.getString('Albanie_capitale') ?? 'Tirana',
          'monnaie': prefs.getString('Albanie_monnaie') ?? 'Lek (ALL)',
          'langue': prefs.getString('Albanie_langue') ?? 'Albanais',
          'camping': prefs.getString('Albanie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Albanie_vignette') ?? 'Non requis',
        },
        'Allemagne': {
          'capitale': prefs.getString('Allemagne_capitale') ?? 'Berlin',
          'monnaie': prefs.getString('Allemagne_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Allemagne_langue') ?? 'Allemand',
          'camping': prefs.getString('Allemagne_camping') ?? 'Autorise',
          'vignette': prefs.getString('Allemagne_vignette') ?? 'Requis',
        },
        'Autriche': {
          'capitale': prefs.getString('Autriche_capitale') ?? 'Vienne',
          'monnaie': prefs.getString('Autriche_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Autriche_langue') ?? 'Allemand',
          'camping': prefs.getString('Autriche_camping') ?? 'Autorise',
          'vignette': prefs.getString('Autriche_vignette') ?? 'Requis',
        },
        'Bosnie-Herzegovine': {
          'capitale': prefs.getString('Bosnie_Herzegovine_capitale') ?? 'Sarajevo',
          'monnaie': prefs.getString('Bosnie_Herzegovine_monnaie') ?? 'Mark convertible (BAM)',
          'langue': prefs.getString('Bosnie_Herzegovine_langue') ?? 'Bosnien',
          'camping': prefs.getString('Bosnie_Herzegovine_camping') ?? 'Autorise',
          'vignette': prefs.getString('Bosni_eHerzegovine_vignette') ?? 'Non requis',
        },
        'Bulgarie': {
          'capitale': prefs.getString('Bulgarie_capitale') ?? 'Sofia',
          'monnaie': prefs.getString('Bulgarie_monnaie') ?? 'Lev (BGN)',
          'langue': prefs.getString('Bulgarie_langue') ?? 'Bulgare',
          'camping': prefs.getString('Bulgarie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Bulgarie_vignette') ?? 'Requis',
        },
        'Croatie': {
          'capitale': prefs.getString('Croatie_capitale') ?? 'Zagreb',
          'monnaie': prefs.getString('Croatie_monnaie') ?? 'Kuna (HRK)',
          'langue': prefs.getString('Croatie_langue') ?? 'Croate',
          'camping': prefs.getString('Croatie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Croatie_vignette') ?? 'Requis',
        },
        'France': {
          'capitale': prefs.getString('France_capitale') ?? 'Paris',
          'monnaie': prefs.getString('France_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('France_langue') ?? 'Francais',
          'camping': prefs.getString('France_camping') ?? 'Autorise',
          'vignette': prefs.getString('France_vignette') ?? 'Requis',
        },
        'Grece': {
          'capitale': prefs.getString('Grece_capitale') ?? 'Athenes',
          'monnaie': prefs.getString('Grece_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Grece_langue') ?? 'Grec',
          'camping': prefs.getString('Grece_camping') ?? 'Autorise',
          'vignette': prefs.getString('Grece_vignette') ?? 'Requis',
        },
        'Hongrie': {
          'capitale': prefs.getString('Hongrie_capitale') ?? 'Budapest',
          'monnaie': prefs.getString('Hongrie_monnaie') ?? 'Forint (HUF)',
          'langue': prefs.getString('Hongrie_langue') ?? 'Hongrois',
          'camping': prefs.getString('Hongrie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Hongrie_vignette') ?? 'Requis',
        },
        'Italie': {
          'capitale': prefs.getString('Italie_capitale') ?? 'Rome',
          'monnaie': prefs.getString('Italie_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Italie_langue') ?? 'Italien',
          'camping': prefs.getString('Italie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Italie_vignette') ?? 'Requis',
        },
        'Macedoine Du Nord': {
          'capitale': prefs.getString('Macedoine_Du_Nord_capitale') ?? 'Skopje',
          'monnaie': prefs.getString('Macedoine_Du_Nord_monnaie') ?? 'Denar (MKD)',
          'langue': prefs.getString('Macedoine_Du_Nord_langue') ?? 'Macedonien',
          'camping': prefs.getString('Macedoine_Du_Nord_camping') ?? 'Autorise',
          'vignette': prefs.getString('Macedoine_Du_Nord_vignette') ?? 'Non requis',
        },
        'Montenegro': {
          'capitale': prefs.getString('Montenegro_capitale') ?? 'Podgorica',
          'monnaie': prefs.getString('Montenegro_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Montenegro_langue') ?? 'Montenegrin',
          'camping': prefs.getString('Montenegro_camping') ?? 'Autorise',
          'vignette': prefs.getString('Montenegro_vignette') ?? 'Non requis',
        },
        'Roumanie': {
          'capitale': prefs.getString('Roumanie_capitale') ?? 'Bucarest',
          'monnaie': prefs.getString('Roumanie_monnaie') ?? 'Leu (RON)',
          'langue': prefs.getString('Roumanie_langue') ?? 'Roumain',
          'camping': prefs.getString('Roumanie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Roumanie_vignette') ?? 'Requis',
        },
        'Slovenie': {
          'capitale': prefs.getString('Slovenie_capitale') ?? 'Ljubljana',
          'monnaie': prefs.getString('Slovenie_monnaie') ?? 'Euro (EUR)',
          'langue': prefs.getString('Slovenie_langue') ?? 'Slovene',
          'camping': prefs.getString('Slovenie_camping') ?? 'Autorise',
          'vignette': prefs.getString('Slovenie_vignette') ?? 'Requis',
        },
        'Suisse': {
          'capitale': prefs.getString('Suisse_capitale') ?? 'Berne',
          'monnaie': prefs.getString('Suisse_monnaie') ?? 'Franc suisse (CHF)',
          'langue': prefs.getString('Suisse_langue') ?? 'Francais, Allemand, Italien, Romanche',
          'camping': prefs.getString('Suisse_camping') ?? 'Autorise',
          'vignette': prefs.getString('Suisse_vignette') ?? 'Requis',
        },
      };
    });
  }

  Future<void> _updateCountryInfo(String country, String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      countryInfo[country]![key] = value;
    });
    await prefs.setString('${country}_$key', value);
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
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _showCountryDetails(context, country, flagPath, mapPath, capitale, monnaie, langue, camping, vignette);
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

  void _showCountryDetails(BuildContext context, String country, String flagPath, String mapPath, String capitale, String monnaie, String langue, String camping, String vignette) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountryDialog(
          country: country,
          flagPath: flagPath,
          mapPath: mapPath,
          capitale: capitale,
          monnaie: monnaie,
          langue: langue,
          camping: camping,
          vignette: vignette,
          onUpdate: _updateCountryInfo,
        );
      },
    );
  }
}