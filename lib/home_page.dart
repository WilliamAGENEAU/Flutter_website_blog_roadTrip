import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'destinations.dart';
import 'apropos.dart';
import 'van.dart';
import 'projets.dart';
import 'pays.dart';
import 'planning.dart';
import 'acceuil.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) toggleTheme;

  const HomePage(
      {super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _scrollToIndex(int index) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight == 0) {
      return;
    }

    _scrollController.animateTo(
      index * screenHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight == 0) {
      return const Center(child: Text('Error: Invalid screen height'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          height: 80,
        ),
        elevation: 2,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 0.3,
          ),
        ),
        actions: [
          _buildNavigationButton(0, 'Accueil', Icons.home),
          _buildNavigationButton(1, 'Destinations', Icons.location_on),
          _buildNavigationButton(2, 'À propos', Icons.info),
          _buildNavigationButton(3, 'Van', Icons.directions_car),
          _buildNavigationButton(4, 'Projets', Icons.work),
          _buildNavigationButton(5, 'Pays', Icons.map),
          _buildNavigationButton(6, 'Planning', Icons.calendar_month),
          // Bouton avec image pour ouvrir le lien Polarsteps
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => _launchUrl(
                  'https://www.polarsteps.com/WilliamAGENEAU/14467644-2025-eu-east'),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() {}),
                onExit: (_) => setState(() {}),
                child: Image.asset(
                  'images/polarstep.png',
                  height: 40,
                ),
              ),
            ),
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
            if (screenHeight > 0) ...[
              SizedBox(
                  height: screenHeight,
                  child:
                      Acceuil(scrollToDestinations: () => _scrollToIndex(1))),
              SizedBox(height: screenHeight, child: const Destinations()),
              SizedBox(height: screenHeight, child: const Apropos()),
              SizedBox(height: screenHeight, child: const Van()),
              SizedBox(height: screenHeight, child: const Projets()),
              SizedBox(height: screenHeight, child: const Pays()),
              SizedBox(height: screenHeight, child: const PlanningPage()),
            ] else
              const Center(child: Text('Error: Invalid screen height')),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(int index, String label, IconData icon) {
    return TextButton.icon(
      icon: Icon(
        icon,
        color: _selectedIndex == index
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: _selectedIndex == index
            ? Theme.of(context).colorScheme.primary
            : null,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        _scrollToIndex(index);
      },
    );
  }
}
