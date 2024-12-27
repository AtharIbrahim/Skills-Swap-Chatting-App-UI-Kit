import 'package:flutter/material.dart';
import 'package:skills_swap/common/app_colors.dart';

class HoverableTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;
  const HoverableTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: hintText, // Floating label
          labelStyle: const TextStyle(
            color: AppColors.greySHADE500, // Initial color of the label
          ),
          floatingLabelStyle: TextStyle(
            // foreground: Paint()
            //   ..shader = LinearGradient(
            //     colors: [Colors.orange, Colors.pink], // Gradient colors
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            color: AppColors.text_black,
          ),
          prefixIcon: icon,
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
                width: 2.0 // Border color when focused
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 2.0,
              color: AppColors.greySHADE500, // Border color when not focused
            ),
          ),
        ),
      ),
    );
  }
}
