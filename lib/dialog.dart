import 'package:flutter/material.dart';
import 'package:flutter_website_blog/widget/meteo.dart';

class CountryDialog extends StatelessWidget {
  final String country;
  final String flagPath;
  final String mapPath;

  const CountryDialog({
    super.key,
    required this.country,
    required this.flagPath,
    required this.mapPath,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with flag
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        flagPath,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      country,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Main content with 3 cards
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // First card: General Information
                      Expanded(
                        flex: 4,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Informations générales",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(height: 8),
                                _buildInfoRow("Capitale", "Tirana"),
                                _buildInfoRow("Monnaie", "Lek (ALL)"),
                                _buildInfoRow("Langue", "Albanais"),
                                _buildInfoRow("Camping sauvage", "Autorisé"),
                                _buildInfoRow("Vignette et autoroute", "Non requis"),
                                _buildInfoRow("Membre de l'UE", "Non"),
                                _buildInfoRow("Eau potable", "Partiellement"),
                                _buildInfoRow("Prix de l'essence", "1.50 €/L"),
                                _buildInfoRow("Forfait téléphone", "10 €/10 Go"),
                                _buildInfoRow("Dormir chez l'habitant", "Booking/Airbnb"),
                                _buildInfoRow("Vacances scolaires", "Juillet/Août"),
                                _buildInfoRow("Spot surf", "Durrës, Vlorë"),
                                _buildInfoRow("Sens de circulation", "Droite"),
                                _buildInfoRow(
                                    "Équipement obligatoire", "Gilet, triangle, extincteur"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Second card: Typical Dishes
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Plats typiques",
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      const SizedBox(height: 8),
                                      Text("Byrek, Tavë Kosi, Baklava, Fërgesë, etc."),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                                                        ),
                                                        elevation: 4,
                                                        child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mots usuels",
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  Text("Bonjour : Përshëndetje"),
                                  Text("Merci : Faleminderit"),
                                  Text("Oui : Po"),
                                  Text("Non : Jo"),
                                  Text("S'il vous plaît : Ju lutem"),
                                ],
                              ),
                                                        ),
                                                      ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),                      
                    ],
                  ),
                ),
                // Weather section
                Meteo(),
              ],
            ),
          ),
          // Map image at the top right corner
          Positioned(
            top: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                mapPath,
                width: 240,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(content),
        ],
      ),
    );
  }
}
