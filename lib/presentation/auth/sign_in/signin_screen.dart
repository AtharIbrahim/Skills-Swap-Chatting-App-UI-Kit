import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/error_anim.dart';
import 'package:skills_swap/animations/success_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_email.dart';
import 'package:skills_swap/presentation/auth/sign_in/sign_in_error.dart';
import 'package:skills_swap/presentation/auth/sign_in/sign_in_success.dart';
import 'package:skills_swap/presentation/auth/sign_up/signup_screen.dart';
import 'package:skills_swap/presentation/auth/widgets/auth_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
            "Welcome!",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Your one stop to all skills and knowledge!",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildSignupForm(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
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
            "Sign In",
            style: TextStyle(
              color: AppColors.text_black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          AuthTextField(
            controller: _emailTextController,
            hintText: "Email",
            obscureText: false,
            icon: Icon(Icons.email_outlined, color: AppColors.greySHADE500),
          ),
          SizedBox(height: 12),
          AuthTextField(
            controller: _passwordTextController,
            hintText: "Password",
            obscureText: true,
            icon: Icon(Icons.lock_outline, color: AppColors.greySHADE500),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(
                //   "Remember Me",
                //   style: TextStyle(
                //     color: AppColors.text_black,
                //     fontSize: 14,
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    //
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ForgotEmail(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return AppColors.primaryGradient
                          .createShader(bounds); // Applying the gradient
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors
                            .white, // Text color needs to be white (or any color) for the gradient to show
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
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
        if (_emailTextController.text.isEmpty &&
            _passwordTextController.text.isEmpty) {
          ErrorAnim(context, SignInError());
        } else {
          SuccessAnim(context, SignInSuccess());
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient, // Gradient for button
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.navigate_next, color: AppColors.white, size: 32),
      ),
    );
  }

  Widget _buildFooterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
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
                    SignupScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var scaleTween = Tween(begin: 0.9, end: 1.0);
                  var opacityTween = Tween(begin: 0.0, end: 1.0);
                  var slideTween =
                      Tween(begin: Offset(-1.0, 0.0), end: Offset.zero);

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
              "Sign In?",
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
