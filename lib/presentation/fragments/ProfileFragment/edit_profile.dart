import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/widgets/hoverable_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? userEmail;
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _locationTextController = TextEditingController();
  final TextEditingController _aboutTextController = TextEditingController();

  // Variable to hold the retrieved image (profile image from database)
  ImageProvider? _retrievedImage;
  ImageProvider? _retrievedBGImage;

  // Variable to hold the selected image
  File? _selectedImage;

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

  // Variable to hold the selected image
  File? _headerImage;

  // Function to pick image
  Future<void> _pickHeaderImage() async {
    final ImagePicker picker2 = ImagePicker();
    final XFile? pickedImage2 =
        await picker2.pickImage(source: ImageSource.gallery);

    if (pickedImage2 != null) {
      setState(() {
        _headerImage = File(pickedImage2.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Container with Profile Picture
          Stack(
            alignment: Alignment.center,
            children: [
              // Container with gradient and image
              Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: _headerImage != null
                          ? DecorationImage(
                              image: FileImage(_headerImage!),
                              fit: BoxFit.cover,
                            )
                          : _retrievedBGImage != null
                              ? DecorationImage(
                                  image: _retrievedBGImage!,
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(
                                      'assets/images/bg3.jpg'), // Default image
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _pickHeaderImage,
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
                  controller: _locationTextController,
                  hintText: "Location",
                  obscureText: false,
                  icon: Icon(
                    Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                HoverableTextField(
                  controller: _aboutTextController,
                  hintText: "About",
                  obscureText: false,
                  icon: Icon(
                    Icons.summarize_outlined,
                  ),
                ),
                const SizedBox(height: 15),

                // Save Button
                InkWell(
                  onTap: () {
                    // Save changes logic here
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
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
