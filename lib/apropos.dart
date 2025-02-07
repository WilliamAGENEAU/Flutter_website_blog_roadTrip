import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'WE ARE WALLY TRIP\n\nHi it’s William and Sarah. '
                'In March 2025, we packed up our bags, kissed our cozy home goodbye, '
                'and embarked on this slow living adventure we call Wally Trip. '
                'we’re embarking on a new chapter: a 6-month road trip through the beautiful Balkans,'
                'from March to September, in our self-converted van. \n\n'
                'We’re two young graduates, one in computer science and the other in agronomy. '
                'Our goal is to share our adventure through music and images of our daily life, '
                'activities, and the amazing people we meet along the way. '
                'Each country we visit will tell its own story,'
                'and we can’t wait to share it all with you—moments of expression, contagious joy, and harmonious vibes.'
                'We believe this world needs more simplicity, connection, and togetherness.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(350.0),
                  topRight: Radius.circular(350.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'images/about1.jpg'), // Remplacez avec le chemin de votre image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
