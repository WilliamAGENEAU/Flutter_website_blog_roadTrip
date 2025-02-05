import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'destinations.dart';
import 'apropos.dart';
import 'van.dart';
import 'videos.dart';
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
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavigationButton(0, 'WELCOME'),
              _buildNavigationButton(1, 'VIDEOS'),
              _buildNavigationButton(2, 'TRIP'),
              _buildNavigationButton(3, 'VAN'),
              _buildNavigationButton(4, 'ABOUT US'),
              _buildNavigationButton(5, 'PLANS'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: InkWell(
              onTap: () => _launchUrl(
                  'https://www.polarsteps.com/WilliamAGENEAU/14467644-2025-eu-east'),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() {}),
                onExit: (_) => setState(() {}),
                child: Image.asset(
                  'images/polarstep.png',
                  height: 25,
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
                  height: screenHeight - 40,
                  child:
                      Acceuil(scrollToDestinations: () => _scrollToIndex(1))),
              SizedBox(height: screenHeight, child: const Videos()),
              SizedBox(height: screenHeight, child: const Destinations()),
              SizedBox(height: screenHeight, child: const Van()),
              SizedBox(height: screenHeight, child: const Apropos()),
              SizedBox(height: screenHeight, child: const PlanningPage()),
            ] else
              const Center(child: Text('Error: Invalid screen height')),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(int index, String label) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            _selectedIndex == index ? Colors.black : Colors.transparent,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        _scrollToIndex(index);
      },
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: _selectedIndex == index ? Colors.white : Colors.white,
        ),
      ),
    );
  }
}
