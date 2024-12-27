import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_swap/common/app_colors.dart';

class SeeFriendsDetails extends StatefulWidget {
  final String email;
  const SeeFriendsDetails({
    super.key,
    required this.email,
  });

  @override
  State<SeeFriendsDetails> createState() => _SeeFriendsDetailsState();
}

class _SeeFriendsDetailsState extends State<SeeFriendsDetails> {
  String name = '';
  String location = '';
  String? userEmail;
  Image? profileImage;
  Image? bgImage;
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
    });
    return null;
  }

  final TextEditingController _aboutTextController = TextEditingController();
  // List to hold skills
  List<String> skills = [
    'Java',
    'Dart',
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
      appBar: AppBar(),
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
                                    // DefaultAnim(context, FriendsList());
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
                                    // DefaultAnim(context, FriendsList());
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
                                    // DefaultAnim(context, FriendsList());
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
                // DefaultAnim(context, FriendsList());
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
            ],
          ),
          Text(
            _aboutTextController.text,
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
                "Skills",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // Display skills as tags
          Wrap(
            spacing: 8.0, // Horizontal space between tags
            runSpacing: 4.0, // Vertical space between lines of tags
            children: skills.map((skill) {
              return GestureDetector(
                child: Chip(
                  label: Text(skill),
                  backgroundColor: AppColors.white,
                  labelStyle: TextStyle(
                    color: AppColors.greySHADE800.withOpacity(0.9),
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
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // Display languages as tags (chips)
          Wrap(
            spacing: 8.0, // Horizontal space between tags
            runSpacing: 4.0, // Vertical space between lines of tags
            children: languages.map((language) {
              return GestureDetector(
                child: Chip(
                  label: Text(language),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: AppColors.greySHADE800.withOpacity(0.9),
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
