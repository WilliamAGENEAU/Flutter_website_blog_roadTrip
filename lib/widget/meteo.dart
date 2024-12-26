import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Meteo extends StatelessWidget {
  const Meteo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Météo moyenne",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Table(
                          columnWidths:  {
                            for (int i = 0; i < 12; i++) i: FlexColumnWidth(1),
                          },
                          border: TableBorder.symmetric(
                            inside: BorderSide(color: Colors.grey.shade300),
                          ),
                          children: [
                            _buildTableRow(
                              [
                                "Jan",
                                "Fév",
                                "Mar",
                                "Avr",
                                "Mai",
                                "Juin",
                                "Juil",
                                "Août",
                                "Sept",
                                "Oct",
                                "Nov",
                                "Déc",
                              ],
                              isHeader: true,
                            ),
                            _buildTableRow([
                              "5°C",
                              "6°C",
                              "10°C",
                              "15°C",
                              "20°C",
                              "25°C",
                              "30°C",
                              "28°C",
                              "22°C",
                              "18°C",
                              "10°C",
                              "6°C",
                            ]),
                            _buildTableRow(
                              List.generate(
                                12,
                                (index) => Icon(
                                  index % 3 == 0
                                      ? Icons.snowing
                                      : index % 3 == 1
                                          ? Icons.cloud
                                          : Icons.wb_sunny,
                                  size: 20,
                                  color: Colors.blueAccent,
                                ).toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
}
  }
  
 TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: isHeader
                ? Text(
                    cell,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  )
                : cell.startsWith("Icon")
                    ? Icon(
                        cell.contains("snowflake")
                            ? Icons.snowing
                            : cell.contains("cloud")
                                ? Icons.cloud
                                : Icons.wb_sunny,
                        size: 20,
                        color: cell.contains("snowflake")
                            ? Colors.blue
                            : Colors.orange,
                      )
                    : Text(cell),
          ),
        );
      }).toList(),
    );
  }