import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/error_anim.dart';
import 'package:skills_swap/animations/success_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/sign_in/signin_screen.dart';
import 'package:skills_swap/presentation/auth/sign_up/sign_up_error.dart';
import 'package:skills_swap/presentation/auth/sign_up/sign_up_success.dart';
import 'package:skills_swap/presentation/auth/widgets/auth_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(screenHeight),
                SizedBox(height: screenHeight * 0.03),
                _buildSignupForm(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.03),
                _buildSignupButton(),
                SizedBox(height: screenHeight * 0.02),
                _buildFooterText(),
                SizedBox(height: screenHeight * 0.04),
                _buildSocialIcons(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient, // Applying gradient to header
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Welcome to our community! Sign up to continue.",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
              color: AppColors.text_black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          AuthTextField(
            controller: _usernameController,
            hintText: "Username",
            obscureText: false,
            icon: Icon(Icons.person_outline, color: AppColors.greySHADE500),
          ),
          SizedBox(height: 12),
          AuthTextField(
            controller: _emailController,
            hintText: "Email",
            obscureText: false,
            icon: Icon(Icons.email_outlined, color: AppColors.greySHADE500),
          ),
          SizedBox(height: 12),
          AuthTextField(
            controller: _passwordController,
            hintText: "Password",
            obscureText: true,
            icon: Icon(Icons.lock_outline, color: AppColors.greySHADE500),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "By signing up, you agree to our",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text_black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return AppColors.primaryGradient
                          .createShader(bounds); // Applying the gradient
                    },
                    child: Text(
                      "terms & conditions",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors
                            .white, // Text color needs to be white (or any color) for the gradient to show
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return InkWell(
      onTap: () {
        // Check if other fields are empty
        if (_usernameController.text.isEmpty ||
            _passwordController.text.isEmpty ||
            _emailController.text.isEmpty) {
          ErrorAnim(context, SignUpError());
        } else {
          SuccessAnim(context, SignUpSuccess());
        }
      },
      child: Container(
        height: 50,
        width: 150, // Making the button more responsive
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient, // Gradient for button
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            color: AppColors.text_black,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SigninScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var scaleTween = Tween(begin: 0.9, end: 1.0);
                  var opacityTween = Tween(begin: 0.0, end: 1.0);
                  var slideTween =
                      Tween(begin: Offset(1.0, 0.0), end: Offset.zero);

                  var scaleAnimation = animation.drive(scaleTween);
                  var opacityAnimation = animation.drive(opacityTween);
                  var slideAnimation = animation.drive(slideTween);

                  return SlideTransition(
                    position: slideAnimation,
                    child: FadeTransition(
                      opacity: opacityAnimation,
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: child,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: ShaderMask(
            shaderCallback: (bounds) {
              return AppColors.primaryGradient
                  .createShader(bounds); // Applying the gradient
            },
            child: Text(
              " Sign In?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors
                    .white, // Text color needs to be white (or any color) for the gradient to show
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon("assets/images/google1.png"),
        SizedBox(width: 12),
        _buildSocialIcon("assets/images/facebook1.png"),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.cream,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(assetPath),
      ),
    );
  }
}
