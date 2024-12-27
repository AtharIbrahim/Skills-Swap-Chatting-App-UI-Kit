import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/animations/error_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_error_screen.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_verification.dart';
import 'package:skills_swap/presentation/auth/widgets/hoverable_text_field.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final TextEditingController _emailTextController = TextEditingController();

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            // Lock Icon
            CircleAvatar(
              radius: 80,
              backgroundColor:
                  Colors.transparent, // Make the background transparent
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.withOpacity(0.2), // Apply opacity here
                      Colors.pink.withOpacity(0.5), // Apply opacity here
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return AppColors.primaryGradient.createShader(
                        bounds); // Applying the gradient to the icon
                  },
                  child: Icon(
                    Icons.lock,
                    size: 80,
                    color: Colors
                        .white, // The color here is needed, but it will be overridden by the gradient
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            // Description Text
            const Text(
              "Please Enter Your Email Address To Receive a Verification Code.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            HoverableTextField(
              controller: _emailTextController,
              hintText: "Email",
              obscureText: false,
              icon: Icon(
                Icons.email_outlined,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Spacer(
              flex: 3,
            ),

            // Send Button
            InkWell(
              onTap: () async {
                // Check if email field is empty first
                if (_emailTextController.text.isEmpty) {
                  ErrorAnim(context, ForgotErrorScreen());
                } else {
                  DefaultAnim(context, ForgotVerification());
                }
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: AppColors.primaryGradient, // Gradient for button
                ),
                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
