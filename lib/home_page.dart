import 'package:flutter/material.dart';
import 'destinations.dart';
import 'apropos.dart';
import 'van.dart';
import 'projets.dart';
import 'pays.dart';
import 'contact.dart';
import 'acceuil.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) toggleTheme;

  const HomePage({super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * MediaQuery.of(context).size.height, // Utiliser la hauteur de l'écran
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.abc),
        elevation: 2, // Ajout de l'élévation
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 0.3, // Ligne de séparation
          ),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Accueil',
              style: TextStyle(color: _selectedIndex == 0 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 0 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
              _scrollToIndex(0);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.location_on, color: _selectedIndex == 1 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Destinations',
              style: TextStyle(color: _selectedIndex == 1 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 1 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
              _scrollToIndex(1);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.info, color: _selectedIndex == 2 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'À propos',
              style: TextStyle(color: _selectedIndex == 2 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 2 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
              _scrollToIndex(2);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.directions_car, color: _selectedIndex == 3 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Van',
              style: TextStyle(color: _selectedIndex == 3 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 3 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 3;
              });
              _scrollToIndex(3);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.work, color: _selectedIndex == 4 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Projets',
              style: TextStyle(color: _selectedIndex == 4 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 4 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 4;
              });
              _scrollToIndex(4);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.map, color: _selectedIndex == 5 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Pays',
              style: TextStyle(color: _selectedIndex == 5 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 5 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 5;
              });
              _scrollToIndex(5);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.contact_mail, color: _selectedIndex == 6 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            label: Text(
              'Contact',
              style: TextStyle(color: _selectedIndex == 6 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
            ),
            style: TextButton.styleFrom(
              backgroundColor: _selectedIndex == 6 ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 6;
              });
              _scrollToIndex(6);
            },
          ),
          Switch(
            value: widget.isDarkMode,
            activeColor: Theme.of(context).colorScheme.primary,
            onChanged: widget.toggleTheme,
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
              if (states.contains(WidgetState.selected)) {
                return const Icon(Icons.nightlight_round, color: Colors.white);
              }
              return const Icon(Icons.wb_sunny, color: Colors.white);
            }),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification) {
            int index = (_scrollController.offset / screenHeight).round();
            setState(() {
              _selectedIndex = index;
            });
          }
          return true;
        },
        child: ListView(
          controller: _scrollController,
          children: [
            SizedBox(
              height: screenHeight,
              child: Acceuil(
                scrollToDestinations: () => _scrollToIndex(1), 
              ),
            ),
            SizedBox(
              height: screenHeight,
              child: const Destinations(),
            ),
            SizedBox(
              height: screenHeight,
              child: const Apropos(),
            ),
            SizedBox(
              height: screenHeight,
              child: const Van(),
            ),
            SizedBox(
              height: screenHeight,
              child: const Projets(),
            ),
            SizedBox(
              height: screenHeight,
              child: const Pays(),
            ),
            SizedBox(
              height: screenHeight,
              child: const Contact(),
            ),
          ],
        ),
      ),
    );
  }
}
