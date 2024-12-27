import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/intro/start_intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to another screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Nav to other
      DefaultAnim(context, StartIntro());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Change the color of the mobile above appbar status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.withOpacity(1),
              Colors.pink.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Skill",
                    style: TextStyle(
                      color: AppColors.cream,
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Swap",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Colors.white, // Set the color to match your theme
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "Powered by AIK ",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
