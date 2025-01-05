import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Destinations extends StatefulWidget {
  const Destinations({super.key});

  @override
  _DestinationsState createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  final LatLng laPlagneLatLng = const LatLng(45.5075, 6.6773);
  String selectedLocation = '';
  List<String> images = [];

  void _onMarkerTapped() {
    setState(() {
      selectedLocation = 'La Plagne, Alpes, France';
      images = [
        'assets/images/la_plagne_1.jpg',
        'assets/images/la_plagne_2.jpg',
        'assets/images/la_plagne_3.jpg',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: const Color(0xFF43664E),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(54.5260, 15.2551), // Coordonnées approximatives du centre de l'Europe
                    zoom: 4,
                  ),
                  mapType: MapType.satellite,
                  markers: {
                    Marker(
                      markerId: const MarkerId('laPlagne'),
                      position: laPlagneLatLng,
                      infoWindow: const InfoWindow(title: 'La Plagne'),
                      onTap: _onMarkerTapped,
                    ),
                  },
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.white,
                  child: selectedLocation.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                selectedLocation,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CarouselSlider(
                              options: CarouselOptions(height: 200.0),
                              items: images.map((image) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Image.asset(image, fit: BoxFit.cover);
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text('Cliquez sur un marqueur pour voir les détails'),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}