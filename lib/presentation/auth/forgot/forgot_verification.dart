import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_password.dart';

class ForgotVerification extends StatefulWidget {
  const ForgotVerification({
    super.key,
  });

  @override
  State<ForgotVerification> createState() => _ForgotVerificationState();
}

class _ForgotVerificationState extends State<ForgotVerification> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Verify Your Email",
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
            const Spacer(flex: 2),
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
                    Icons.email,
                    size: 80,
                    color: Colors
                        .white, // The color here is needed, but it will be overridden by the gradient
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Description Text
            const Text(
              "Please Enter 4 Digits Code Sent To Your Email",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOtpTextField(controller: _otpController1),
                _buildOtpTextField(controller: _otpController2),
                _buildOtpTextField(controller: _otpController3),
                _buildOtpTextField(controller: _otpController4),
              ],
            ),
            const SizedBox(height: 20),

            const Spacer(flex: 3),

            // Verify Button
            InkWell(
              onTap: () {
                // Navigate to next screen after OTP verification
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ForgotPassword(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var zoomTween = Tween(begin: 0.0, end: 1.0);
                      var opacityTween = Tween(begin: 0.0, end: 1.0);

                      var zoomAnimation = animation.drive(zoomTween);
                      var opacityAnimation = animation.drive(opacityTween);

                      return FadeTransition(
                        opacity: opacityAnimation,
                        child: ScaleTransition(
                          scale: zoomAnimation,
                          child: child,
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: AppColors.primaryGradient, // Gradient for button
                ),
                child: const Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // OTP TextField widget
  Widget _buildOtpTextField({required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 40,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 1, // Only allow 1 digit
          decoration: InputDecoration(
            counterText: '',
            labelText: ' ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.greySHADE500,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.greySHADE500,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.greySHADE500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
