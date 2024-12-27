import 'package:flutter/material.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/final_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FinalView(),
      ),
    );
  }
}
