import 'package:flutter/material.dart';

import 'package:skills_swap/presentation/bottom_nav_bar/sample_widget.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/size_config.dart';

List<Widget> screens = [
  const SampleWidget(
    label: 'HOME',
    color: Colors.deepPurpleAccent,
  ),
  const SampleWidget(
    label: 'SEARCH',
    color: Colors.amber,
  ),
  const SampleWidget(
    label: 'EXPLORE',
    color: Colors.cyan,
  ),
  const SampleWidget(
    label: 'SETTINGS',
    color: Colors.deepOrangeAccent,
  ),
  const SampleWidget(
    label: 'PROFILE',
    color: Colors.redAccent,
  ),
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 6;
    case 1:
      return AppSizes.blockSizeHorizontal * 25;
    case 2:
      return AppSizes.blockSizeHorizontal * 43.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 63;
    case 4:
      return AppSizes.blockSizeHorizontal * 81.5;
    default:
      return 0;
  }
}

final List<Color> gradient = [
  Colors.orange.withOpacity(0.7),
  Colors.pink.withOpacity(0.2),
  Colors.orange.withOpacity(0.4),
];
