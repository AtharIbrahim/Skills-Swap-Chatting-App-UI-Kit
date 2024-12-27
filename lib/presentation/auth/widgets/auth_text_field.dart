import 'package:flutter/material.dart';
import 'package:skills_swap/common/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500), // Change text color here
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey), // Change hint text color here
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(width: 2), // Border thickness for default state
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greySHADE500,
              width: 2, // Border thickness for enabled state
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greySHADE500,
              width: 2, // Border thickness for focused state
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
