import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/widgets/hoverable_text_field.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  // Variable to hold the selected image
  File? _selectedImage;
  ImageProvider? _retrievedImage;
  String? userEmail;
  String date = '';
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
    });
    return null;
  }

  // Function to pick image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          // Top Container with Profile Picture
          Stack(
            alignment: Alignment.center,
            children: [
              // Stack for Profile Picture with Edit Button
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _selectedImage != null
                        ? FileImage(
                            _selectedImage!) // Use the picked image if available
                        : _retrievedImage != null
                            ? _retrievedImage! // Use the retrieved image from database
                            : const AssetImage('assets/images/person5.jpeg')
                                as ImageProvider, // Fallback to default image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Editable Profile Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HoverableTextField(
                  controller: _nameTextController,
                  hintText: "Name",
                  obscureText: false,
                  icon: Icon(
                    Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                HoverableTextField(
                  controller: _genderTextController,
                  hintText: "Gender",
                  obscureText: false,
                  icon: Icon(
                    Icons.male,
                  ),
                ),
                const SizedBox(height: 15),
                HoverableTextField(
                  controller: _ageTextController,
                  hintText: "Age",
                  obscureText: false,
                  icon: Icon(
                    Icons.date_range,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  date,
                  style: TextStyle(
                    color: AppColors.text_black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 15),

                InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity, // Making the button more responsive
                    decoration: BoxDecoration(
                      gradient:
                          AppColors.primaryGradient, // Gradient for button
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Save changes logic here
                    },
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
}
