import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/routes/routing_string.dart';

class SignUpError extends StatefulWidget {
  const SignUpError({super.key});

  @override
  State<SignUpError> createState() => _SignUpErrorState();
}

class _SignUpErrorState extends State<SignUpError> {
  @override
  Widget build(BuildContext context) {
    // Change the color of the mobile above appbar status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    // Return Layout
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Foreground content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                  ),

                  // Error Code
                  Text(
                    '404',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text_black,
                    ),
                  ),
                  SizedBox(height: 0),
                  Text(
                    'Sign Up Failed!',
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.text_black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Lottie.asset(
                    'assets/lotties/anim2.json',
                    height: 250,
                    width: 250,
                    repeat:
                        true, // Default is true; set to false for one-time play
                  ),

                  // Error Details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Please check your input and and try again. If you don't have an account , consider signing up to access our features.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greySHADE500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Continue Button
                  InkWell(
                    onTap: () {
                      //
                      Navigator.pushNamed(context, SignUpScreenroute);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient:
                            AppColors.primaryGradient, // Gradient for button
                      ),
                      child: Center(
                        child: Text(
                          "Retry",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
