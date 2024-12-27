import 'package:flutter/material.dart';

void DefaultAnim(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var scaleTween = Tween(begin: 0.9, end: 1.0);
        var opacityTween = Tween(begin: 0.0, end: 1.0);

        var scaleAnimation = animation.drive(scaleTween);
        var opacityAnimation = animation.drive(opacityTween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
    ),
  );
}
