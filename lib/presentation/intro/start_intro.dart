import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/sign_in/signin_screen.dart';
import 'package:skills_swap/presentation/auth/sign_up/signup_screen.dart';

class StartIntro extends StatefulWidget {
  const StartIntro({super.key});

  @override
  State<StartIntro> createState() => _StartIntroState();
}

class _StartIntroState extends State<StartIntro> {
  @override
  Widget build(BuildContext context) {
    // Change the color of the mobile above appbar status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              "assets/images/screen5_onboard.png",
              width: double.infinity,
            ),
            // Text
            Text(
              "Let's get started.",
              style: TextStyle(
                color: AppColors.text_black,
                fontSize: 44,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
              ),
              textAlign: TextAlign.start,
            ),

            // Text Details
            Text(
              "Unlock opportunities by exchanging skills effortlessly with SkillSwap!",
              style: TextStyle(
                color: AppColors.text_black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),

            // Join Now BTN
            InkWell(
              onTap: () {
                //
                DefaultAnim(context, SignupScreen());
              },
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient:
                      AppColors.primaryGradient, // Applying gradient to header
                ),
                child: Center(
                  child: Text(
                    "Join Now",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),

            // Already have account login?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's get started.",
                  style: TextStyle(
                    color: AppColors.text_black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    DefaultAnim(context, SigninScreen());
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return AppColors.primaryGradient
                          .createShader(bounds); // Applying the gradient
                    },
                    child: Text(
                      " Login?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors
                            .white, // Text color needs to be white (or any color) for the gradient to show
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
