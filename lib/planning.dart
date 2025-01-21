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

 @override
  void initState() {
    super.initState();
    // Initialisation des locales pour le calendrier
    initializeDateFormatting('fr_FR').then((_) {
      setState(() {}); // Rafraîchissement après initialisation
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Grille 3x3
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _months.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TableCalendar(
                locale: 'fr_FR', // Affichage en français
                focusedDay: _months[index],
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime(2025, 3, 1),
                lastDay: DateTime(2025, 8, 31),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false, // Cache le bouton de format
                  titleCentered: true,
                  rightChevronVisible: false,
                  leftChevronVisible: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
