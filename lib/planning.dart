import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  final List<DateTime> _months = List.generate(
    6,
    (index) => DateTime(2025, 3 + index, 1),
  ); // Génère les mois de mars à août 2025

  late Map<DateTime, List> _events;
// Pays actuellement survolé

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR').then((_) {
      setState(() {});
    });

    _events = _generateEvents();
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  final Map<String, String> _countryColors = {
    'Rose': 'France 🇫🇷',
    'Bleu foncé': 'Italie 🇮🇹',
    'Corail': 'Slovénie 🇸🇮',
    'Violet': 'Croatie 🇭🇷',
    'Jaune doré': 'Bosnie 🇧🇦',
    'Bordeaux': 'Monténégro 🇲🇪',
    'Rouge': 'Albanie 🇦🇱',
    'Vert lime': 'Macédoine 🇲🇰',
    'Turquoise': 'Grèce 🇬🇷',
    'Orange': 'Bulgarie 🇧🇬',
    'Bleu acier': 'Roumanie 🇷🇴',
    'Gris clair': 'Hongrie 🇭🇺',
    'Pêche': 'Slovaquie 🇸🇰',
    'Vert émeraude': 'Autriche 🇦🇹',
    'Indigo': 'Suisse 🇨🇭',
    'Bleu ciel': 'Allemagne 🇩🇪',
  };

  Map<DateTime, List> _generateEvents() {
    Map<DateTime, List> events = {};

    // Périodes existantes
    for (var day = 1; day <= 16; day++) {
      events[_normalizeDate(DateTime(2025, 3, day))] = ['Rose'];
    }
    for (var day = 17; day <= 30; day++) {
      events[_normalizeDate(DateTime(2025, 3, day))] = ['Bleu foncé'];
    }
    events[_normalizeDate(DateTime(2025, 3, 31))] = ['Corail'];
    for (var day = 1; day <= 13; day++) {
      events[_normalizeDate(DateTime(2025, 4, day))] = ['Corail'];
    }

    // Nouvelles périodes ajoutées
    for (var day = 14; day <= 30; day++) {
      events[_normalizeDate(DateTime(2025, 4, day))] = ['Violet'];
    }
    for (var day = 1; day <= 4; day++) {
      events[_normalizeDate(DateTime(2025, 5, day))] = ['Violet'];
    }
    for (var day = 5; day <= 11; day++) {
      events[_normalizeDate(DateTime(2025, 5, day))] = ['Jaune doré'];
    }
    for (var day = 12; day <= 25; day++) {
      events[_normalizeDate(DateTime(2025, 5, day))] = ['Bordeaux'];
    }
    for (var day = 26; day <= 31; day++) {
      events[_normalizeDate(DateTime(2025, 5, day))] = ['Rouge'];
    }
    for (var day = 1; day <= 5; day++) {
      events[_normalizeDate(DateTime(2025, 6, day))] = ['Rouge'];
    }
    for (var day = 6; day <= 8; day++) {
      events[_normalizeDate(DateTime(2025, 6, day))] = ['Vert lime'];
    }
    for (var day = 9; day <= 15; day++) {
      events[_normalizeDate(DateTime(2025, 6, day))] = ['Rouge'];
    }
    for (var day = 16; day <= 30; day++) {
      events[_normalizeDate(DateTime(2025, 6, day))] = ['Turquoise'];
    }
    for (var day = 1; day <= 6; day++) {
      events[_normalizeDate(DateTime(2025, 7, day))] = ['Turquoise'];
    }
    for (var day = 7; day <= 13; day++) {
      events[_normalizeDate(DateTime(2025, 7, day))] = ['Orange'];
    }
    for (var day = 14; day <= 20; day++) {
      events[_normalizeDate(DateTime(2025, 7, day))] = ['Bleu acier'];
    }
    for (var day = 21; day <= 31; day++) {
      events[_normalizeDate(DateTime(2025, 7, day))] = ['Gris clair'];
    }
    for (var day = 1; day <= 3; day++) {
      events[_normalizeDate(DateTime(2025, 8, day))] = ['Pêche'];
    }
    for (var day = 4; day <= 17; day++) {
      events[_normalizeDate(DateTime(2025, 8, day))] = ['Vert émeraude'];
    }
    for (var day = 18; day <= 19; day++) {
      events[_normalizeDate(DateTime(2025, 8, day))] = ['Indigo'];
    }
    for (var day = 20; day <= 21; day++) {
      events[_normalizeDate(DateTime(2025, 8, day))] = ['Bleu ciel'];
    }
    for (var day = 22; day <= 30; day++) {
      events[_normalizeDate(DateTime(2025, 8, day))] = ['Indigo'];
    }
    events[_normalizeDate(DateTime(2025, 8, 31))] = ['Rose'];

    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _months.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TableCalendar(
                locale: 'fr_FR',
                focusedDay: _months[index],
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime(2025, 3, 1),
                lastDay: DateTime(2025, 8, 31),
                headerStyle: const HeaderStyle(
                    leftChevronVisible: false,
                    titleCentered: true,
                    rightChevronVisible: false,
                    formatButtonVisible: false),
                eventLoader: (day) {
                  return _events[_normalizeDate(day)] ?? [];
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final events = _events[_normalizeDate(day)];
                    if (events != null && events.isNotEmpty) {
                      String colorKey = events.first;
                      Color color = _getColorFromName(colorKey);
                      String country = _countryColors[colorKey] ?? '';

                      return MouseRegion(
                        onHover: (_) {
                          setState(() {});
                        },
                        onExit: (_) {
                          setState(() {});
                        },
                        child: Tooltip(
                          message: country,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getColorFromName(String name) {
    switch (name) {
      case 'Rose':
        return Colors.pink;
      case 'Bleu foncé':
        return Colors.blueAccent;
      case 'Corail':
        return Colors.deepOrange;
      case 'Violet':
        return Colors.purple;
      case 'Jaune doré':
        return Colors.yellow.shade700;
      case 'Bordeaux':
        return Colors.red.shade900;
      case 'Rouge':
        return Colors.red;
      case 'Vert lime':
        return Colors.lime;
      case 'Turquoise':
        return Colors.teal;
      case 'Orange':
        return Colors.orange;
      case 'Bleu acier':
        return Colors.blueGrey;
      case 'Gris clair':
        return Colors.grey;
      case 'Pêche':
        return Colors.orange.shade300;
      case 'Vert émeraude':
        return Colors.green.shade600;
      case 'Indigo':
        return Colors.indigo;
      case 'Bleu ciel':
        return Colors.lightBlue;
      default:
        return Colors.transparent;
    }
  }
}
