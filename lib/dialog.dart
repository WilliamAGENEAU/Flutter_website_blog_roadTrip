import 'package:flutter/material.dart';
import 'package:flutter_website_blog/widget/meteo.dart';

class CountryDialog extends StatefulWidget {
  final String country;
  final String flagPath;
  final String mapPath;
  final String capitale;
  final String monnaie;
  final String langue;
  final String camping;
  final String vignette;

  const CountryDialog({
    super.key,
    required this.country,
    required this.flagPath,
    required this.mapPath,
    required this.capitale,
    required this.monnaie,
    required this.langue,
    required this.camping,
    required this.vignette,
  });

  @override
  _CountryDialogState createState() => _CountryDialogState();
}

class _CountryDialogState extends State<CountryDialog> {
  late TextEditingController capitaleController;
  late TextEditingController monnaieController;
  late TextEditingController langueController;
  late TextEditingController campingController;
  late TextEditingController vignetteController;

  @override
  void initState() {
    super.initState();
    capitaleController = TextEditingController(text: widget.capitale);
    monnaieController = TextEditingController(text: widget.monnaie);
    langueController = TextEditingController(text: widget.langue);
    campingController = TextEditingController(text: widget.camping);
    vignetteController = TextEditingController(text: widget.vignette);
  }

  @override
  void dispose() {
    capitaleController.dispose();
    monnaieController.dispose();
    langueController.dispose();
    campingController.dispose();
    vignetteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: FocusScope(
        autofocus: true,
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
                          widget.flagPath,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.country,
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
                                  _buildTextField("Capitale", capitaleController),
                                  _buildTextField("Monnaie", monnaieController),
                                  _buildTextField("Langue", langueController),
                                  _buildTextField("Camping sauvage", campingController),
                                  _buildTextField("Vignette et autoroute", vignetteController),
                                  // Ajoutez d'autres informations ici
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
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
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Weather section at the bottom
                  Meteo(),
                ],
              ),
            ),
            // Map image at the top left corner
            Positioned(
              top: 16,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.mapPath,
                  width: 240,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        controller: controller,
      ),
    );
  }
}