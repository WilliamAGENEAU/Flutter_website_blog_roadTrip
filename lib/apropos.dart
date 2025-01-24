import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      color: Colors.green.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PersonCard(
              imagePath: 'images/william.png',
              name: 'William AGENEAU',
              details: '',
            ),
          ),
          Expanded(
            child: PersonCard(
              imagePath: 'images/sarah.png',
              name: 'Sarah DAVENEL',
              details:
                  'Mes études : Biologie niveau Master\nMes voyages : Italie, Irlande\nMes anecdotes : .....',
            ),
          ),
        ],
      ),
    );
  }
}

class PersonCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String details;

  const PersonCard({
    required this.imagePath,
    required this.name,
    required this.details,
    super.key,
  });

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(widget.imagePath, fit: BoxFit.cover),
          ),
          AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                height: _heightAnimation.value,
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      if (_heightAnimation.value > 50) ...[
                        SizedBox(height: 10),
                        Text(
                          widget.details,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
