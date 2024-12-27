import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/widgets/hoverable_text_field.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String? userEmail;
  final TextEditingController _fromSkillTextController =
      TextEditingController();
  final TextEditingController _toSkillTextController = TextEditingController();
  final TextEditingController _detailsTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          // Editable Profile Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                HoverableTextField(
                  controller: _fromSkillTextController,
                  hintText: "From Skill",
                  obscureText: false,
                  icon: Icon(
                    Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                HoverableTextField(
                  controller: _toSkillTextController,
                  hintText: "To Skill",
                  obscureText: false,
                  icon: Icon(
                    Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                HoverableTextField(
                  controller: _detailsTextController,
                  hintText: "Details",
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
