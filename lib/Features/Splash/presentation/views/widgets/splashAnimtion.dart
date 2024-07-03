import 'package:flutter/material.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({
    super.key,
    required this.slidAnimation,
  });

  final Animation<Offset> slidAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidAnimation,
            child: const Text(
              'Read Free books',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
