import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/message_activity.dart';
import 'package:skills_swap/presentation/fragments/SearchFragment/profile_details.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({
    super.key,
  });

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String? userEmail;
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
    });
    return null;
  }

  Image? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Btn
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 24,
              ),
              // User Personal
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Iser Image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profileImage != null
                        ? profileImage!.image
                        : const AssetImage(
                            "assets/images/person5.jpeg"), // Default image if profileImage is null
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // USer Personal
                  _buildPersonalState(context),

                  SizedBox(
                    height: 12,
                  ),
                  // Skill Swap
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Skills
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.greySHADE500
                                  .withOpacity(0.2), // Lighter shade
                              AppColors.greySHADE500
                                  .withOpacity(0.3), // Darker shade
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // Shadow below
                              offset: Offset(
                                  0, 0), // Horizontal and vertical shadow
                              blurRadius: 6, // Softness of shadow
                            ),
                            BoxShadow(
                              color: Colors.white
                                  .withOpacity(1), // Highlight above
                              offset: Offset(0, 0), // Opposite direction
                              blurRadius: 6, // Softness of highlight
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4), // Optional padding
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures the width adjusts to content
                          children: [
                            // From Skill
                            Text(
                              "Java",
                              style: TextStyle(
                                color: AppColors.greySHADE800,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            // Swap Icon
                            Icon(
                              Icons.swap_horiz_rounded,
                              color: AppColors.text_black,
                            ),
                            SizedBox(width: 4),
                            // To Skill
                            Text(
                              "Python",
                              style: TextStyle(
                                color: AppColors.greySHADE800,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Follow BTN
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColors
                                .primaryGradient, // Gradient for button
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Post Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Detail Text
                      Text(
                        "Details",
                        style: TextStyle(
                          color: AppColors.text_black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // User Details
                      Text(
                        "I want to learn Flutter in exchange for React skills.",
                        style: TextStyle(
                          color: AppColors.greySHADE800,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        maxLines: 100, // Optional to limit overflow
                        overflow: TextOverflow
                            .ellipsis, // Handles excessive content gracefully
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ],
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}

// Message, see profile, etc Section
Widget _buildPersonalState(BuildContext context) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey.withOpacity(0.5),
        width: 2,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn(Icons.rate_review, "New"),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: VerticalDivider(width: 1),
          ),
          InkWell(
            onTap: () {
              //
              DefaultAnim(context, MessageActivity());
            },
            child: _buildStatColumn(
              Icons.message,
              "Message",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: VerticalDivider(width: 1),
          ),
          InkWell(
            onTap: () {
              //
              DefaultAnim(context, ProfileDetails());
            },
            child: _buildStatColumn(
              Icons.person,
              "Profile",
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatColumn(IconData value, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        value,
        color: AppColors.greySHADE800.withOpacity(0.8),
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
