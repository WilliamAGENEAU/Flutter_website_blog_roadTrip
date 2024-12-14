import 'package:flutter/material.dart';
import 'package:flutter_website_blog/home_page.dart';
import 'package:flutter_website_blog/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  final MaterialTheme _materialTheme = MaterialTheme(const TextTheme());

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _materialTheme.light(),
      darkTheme: _materialTheme.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: _isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}
