import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_website_blog/widget/markers.dart';
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
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF904a4a), // Fond rouge
      child: Row(
        children: [
          // Carte interactive
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(44.0, 17.0), // Centré sur les Balkans
                  initialZoom: 5.1,
                  onTap: (_, __) {
                    // Si on clique ailleurs, on réinitialise le container
                    setState(() {
                      selectedLocation = null;
                      selectedCountry = null;
                      selectedInfo = null;
                      selectedIndex = null;
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: markers
                            .map((marker) =>
                                LatLng(marker['lat'], marker['lng']))
                            .toList(),
                        strokeWidth: 2.0,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: markers.asMap().entries.map((entry) {
                      int index = entry.key;
                      var marker = entry.value;
                      return Marker(
                        point: LatLng(marker['lat'], marker['lng']),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLocation = marker['name'];
                              selectedCountry = marker['country'];
                              selectedInfo = marker['info'];
                              selectedIndex =
                                  index + 1; // Position dans la liste
                            });
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 35,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 1, left: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(1500),
                                  ),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
                color: Theme.of(context).colorScheme.primaryContainer,
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
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                child: Text(
                                  selectedIndex
                                      .toString(), // Numéro de position
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
