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
  Duration _countdownDuration =
      Duration(days: 34, hours: 5, minutes: 43, seconds: 2);

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gifController.repeat(
          min: 0, max: 29, period: const Duration(seconds: 2));
    });

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
    return Container(
      color: const Color(0xFFffdad8), // Fond conservé
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 50,
                  child: Gif(
                    autostart: Autostart.loop,
                    controller: _gifController,
                    image: AssetImage(
                        'images/title.gif'), // Assurez-vous que le GIF est bien placé dans assets
                  ),
                ),
              ],
            ),
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
    );
  }
}
