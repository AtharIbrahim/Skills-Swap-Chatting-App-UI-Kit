import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/edit_profile.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/friends_list.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/message_activity.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/settings_account.dart';

class SeeProfileDetails extends StatefulWidget {
  const SeeProfileDetails({super.key});

  @override
  State<SeeProfileDetails> createState() => _SeeProfileDetailsState();
}

class _SeeProfileDetailsState extends State<SeeProfileDetails> {
  String name = 'Athar Ibrahim';
  String location = 'Choa Road, Chakwal';
  String about = 'Hi There';
  Image? profileImage;
  Image? bgImage;

  // List to hold skills
  List<String> skills = [
    'dart',
    'java',
  ];

  // List to hold languages
  List<String> languages = [
    'English',
    'German',
  ];

  @override
  Widget build(BuildContext context) {
    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.oange, // Transparent status bar
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Collapsible AppBar
          SliverAppBar(
            expandedHeight: screenHeight * 0.5, // Increased height of AppBar
            pinned: true,
            toolbarHeight: 100,

            automaticallyImplyLeading: false, // Remove default back icon
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: bgImage != null
                      ? bgImage! // Use the decoded bgImage if it is available
                      : Image.asset(
                          'assets/images/bg3.jpg', // Fallback to default background image
                          fit:
                              BoxFit.cover, // Ensure it covers the whole AppBar
                        ),
                ),
                FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: bgImage != null
                            ? bgImage! // Use the decoded bgImage if it is available
                            : Image.asset(
                                'assets/images/bg3.jpg', // Fallback to default background image
                                fit: BoxFit
                                    .cover, // Ensure it covers the whole AppBar
                              ),
                      ),
                      // Gradient Overlay
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black54],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 48,
                        right: 16,
                        child: InkWell(
                          onTap: () {
                            //
                            DefaultAnim(context, EditProfile());
                          },
                          child: Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      // Profile Details in Expanded AppBar
                      Positioned(
                        top: 80,
                        left: screenWidth * 0.1,
                        right: screenWidth * 0.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the entire row
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Add your functionality here
                                    DefaultAnim(context, MessageActivity());
                                  },
                                ),
                                SizedBox(
                                    width:
                                        3), // Adjust the space between the icon and the image
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: profileImage != null
                                      ? profileImage!.image
                                      : const AssetImage(
                                          "assets/images/person5.jpeg"), // Default image if profileImage is null
                                ),

                                SizedBox(
                                    width:
                                        3), // Adjust the space between the image and the icon
                                IconButton(
                                  icon: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Add your functionality here
                                    DefaultAnim(context, SettingsAccount());
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),

                            // Friends
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    DefaultAnim(context, FriendsList());
                                  },
                                  child: Transform.translate(
                                    offset: const Offset(8, 0),
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          "assets/images/person1.jpeg"),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    DefaultAnim(context, FriendsList());
                                  },
                                  child: Transform.translate(
                                    offset: const Offset(-4, 0),
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          "assets/images/person2.jpeg"),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    DefaultAnim(context, FriendsList());
                                  },
                                  child: Transform.translate(
                                    offset: const Offset(-20, 0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.greySHADE500
                                            .withOpacity(0.9),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "+12",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  title: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final bool isCollapsed = constraints.maxHeight <
                          100; // Adjust collapse threshold
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isCollapsed ? 1.0 : 0.0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // User Profile Image
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: profileImage != null
                                    ? profileImage!.image
                                    : const AssetImage(
                                        "assets/images/person5.jpeg"), // Default image if profileImage is null
                              ),

                              const SizedBox(width: 8),

                              const SizedBox(width: 8),
                              // User Info
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    location,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Followers State
                  _buildFollowersState(),

                  SizedBox(
                    height: 16,
                  ),
                  // About Section
                  _buildAboutSection(),

                  SizedBox(
                    height: 16,
                  ),
                  // Education Section
                  _buildEducationSection(),

                  SizedBox(
                    height: 16,
                  ),
                  // Skills Section
                  _buildSkillsSection(),

                  SizedBox(
                    height: 16,
                  ),
                  // Language Section
                  _buildLanguageSection(),

                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Followers Section
  Widget _buildFollowersState() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatColumn("1250", "Activities"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: VerticalDivider(width: 1),
            ),
            _buildStatColumn("250", "Successful"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: VerticalDivider(width: 1),
            ),
            InkWell(
              onTap: () {
                DefaultAnim(context, FriendsList());
              },
              child: _buildStatColumn(
                "125",
                "Followers",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColors.greySHADE800.withOpacity(0.8),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // About Section
  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
      ),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *
              0.9), // Ensure the width is responsive
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "About",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.grey),
                onPressed: () {
                  DefaultAnim(context, EditProfile());
                },
              ),
            ],
          ),
          Text(
            about,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  // List to hold education entries
  List<Map<String, String>> educationList = [
    {
      'institution': 'University Of Chakwal',
      'degree': 'BS CS, Computer Science',
      'grade': 'Grade: 3.7',
      'image': 'assets/images/avatar.jpg',
    },
  ];
  // Function to add new education entry
  void _addEducation() {
    setState(() {
      educationList.add({
        'institution': 'New University',
        'degree': 'New Degree',
        'grade': 'Grade: --',
        'image': 'assets/images/avatar.jpg',
      });
    });
  }

  // Education Section
  Widget _buildEducationSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            0.9, // Ensure the width is responsive
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text & Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Education",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.grey),
                    onPressed: _addEducation, // Add a new education entry
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      // Edit functionality
                    },
                  ),
                ],
              ),
            ],
          ),
          // Education Entries
          Column(
            children: educationList.map((education) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(education['image']!),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Institute Name
                        Text(
                          education['institution']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Subject Name
                        Text(
                          education['degree']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // Grades
                        Text(
                          education['grade']!,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  //
  //
  // Skills Section Start
  // Dialog Function
  void _openAddSkillDialog() {
    TextEditingController _skillController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add New Skill",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _skillController,
                  decoration: InputDecoration(
                    hintText: 'Enter the name of the skill',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12), // Larger button
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        if (_skillController.text.isNotEmpty) {
                          setState(() {
                            skills.add(_skillController.text);
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient:
                              AppColors.primaryGradient, // Gradient for button
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      },
    );
  }

  // Function to remove a skill from the list
  void _removeSkill(String skill) {
    setState(() {
      skills.remove(skill);
    });
  }

  // Skills Section
  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Skills",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.grey),
                onPressed: _openAddSkillDialog,
              ),
            ],
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: skills.map((skill) {
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text(
                          'Delete Skill',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        content: const Text(
                          'Are you sure you want to delete this skill?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _removeSkill(skill);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Chip(
                  label: Text(skill),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  //
  //
  void _openAddLanguageDialog() {
    TextEditingController _languageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          elevation: 15, // Subtle shadow for depth
          backgroundColor:
              Colors.transparent, // Transparent background for gradient effect
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ], // Gradient effect
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with custom style
                Text(
                  "Add New Language",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text_black, // Title color
                  ),
                ),
                SizedBox(height: 16),

                // Text input field with icon
                TextField(
                  controller: _languageController,
                  decoration: InputDecoration(
                    hintText: 'Enter the name of the language',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.language,
                      color: Colors.black,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 1),
                    ),
                  ),
                  style:
                      TextStyle(color: Colors.black), // Text color inside input
                ),
                SizedBox(height: 16),

                // Action buttons with a more modern style
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12), // Larger button
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        if (_languageController.text.isNotEmpty) {
                          setState(() {
                            languages.add(_languageController.text);
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient:
                              AppColors.primaryGradient, // Gradient for button
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      },
    );
  }

  // Function to remove a language from the list
  void _removeLanguage(String language) {
    setState(() {
      languages.remove(language);
    });
  }

  // Language Section UI
  Widget _buildLanguageSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            0.9, // Ensure the width is responsive
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text & Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Languages",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.grey),
                onPressed:
                    _openAddLanguageDialog, // Open the dialog to add a language
              ),
            ],
          ),
          // Display languages as tags (chips)
          Wrap(
            spacing: 8.0, // Horizontal space between tags
            runSpacing: 4.0, // Vertical space between lines of tags
            children: languages.map((language) {
              return GestureDetector(
                onLongPress: () {
                  // Show a confirmation to delete the language on long press
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
                        title: Text(
                          'Delete Language',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to delete this language?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _removeLanguage(language);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Chip(
                  label: Text(language),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: AppColors.text_black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
