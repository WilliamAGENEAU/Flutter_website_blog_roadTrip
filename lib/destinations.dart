import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Nécessaire pour les coordonnées GPS

class Destinations extends StatefulWidget {
  const Destinations({super.key});

  @override
  _DestinationsState createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  String? selectedLocation;
  String? selectedCountry;
  String? selectedInfo;

  // Coordonnées des marqueurs
  final List<Map<String, dynamic>> markers = [
    {
      'name': 'Zagreb',
      'country': 'Croatie',
      'info':
          '09/04/2025 (4 nuits)\n\nZagreb, la capitale de la Croatie, est une ville dynamique qui allie charme historique et modernité. '
              'Le quartier de la Haute Ville, avec sa cathédrale néogothique et sa place Saint-Marc, témoigne de son riche patrimoine.',
      'lat': 45.8150,
      'lng': 15.9819,
    },
    // Vous pouvez ajouter plus de marqueurs ici
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF43664E), // Fond vert
      child: Row(
        children: [
          // Carte interactive
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(44.0, 17.0), // Centré sur les Balkans
                  initialZoom: 5.5,
                  onTap: (_, __) {
                    // Si on clique ailleurs, on réinitialise le container
                    setState(() {
                      selectedLocation = null;
                      selectedCountry = null;
                      selectedInfo = null;
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: markers
                        .map(
                          (marker) => Marker(
                            point: LatLng(marker['lat'], marker['lng']),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedLocation = marker['name'];
                                  selectedCountry = marker['country'];
                                  selectedInfo = marker['info'];
                                });
                              },
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          // Blog / Container d'informations
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: selectedLocation != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titre
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Text(
                                  selectedLocation![0], // Première lettre
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedLocation!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    selectedCountry!,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            selectedInfo!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  : const Center(
                      child: Text(
                        'Aucune sélection',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
