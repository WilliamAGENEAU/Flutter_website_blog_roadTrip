import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class Acceuil extends StatefulWidget {
  final VoidCallback scrollToDestinations;

  const Acceuil({super.key, required this.scrollToDestinations});

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> with SingleTickerProviderStateMixin {
  late GifController _gifController;
  late Timer _timer;
  late Duration _countdownDuration;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gifController.repeat(
          min: 0, max: 29, period: const Duration(seconds: 2));
    });

    final DateTime now = DateTime.now();
    final DateTime targetDate = DateTime(2025, 3, 23, 0, 1);
    _countdownDuration = targetDate.difference(now);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownDuration.inSeconds > 0) {
          _countdownDuration -= Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _gifController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${duration.inDays}:${twoDigits(duration.inHours % 24)}:${twoDigits(duration.inMinutes % 60)}:${twoDigits(duration.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/acceuil.jpg',
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              height: 0.3,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => _launchUrl(
                'https://www.youtube.com/@williamageneauWally',
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text(
                        'NEXT YOUTUBE MIX PREMIERES IN ${_formatDuration(_countdownDuration)}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
