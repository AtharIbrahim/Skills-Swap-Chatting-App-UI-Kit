import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/SearchFragment/post_details.dart';

// Post model
class Post {
  final String email;
  final String fromSkill;
  final String details;
  final String toSkill;

  Post({
    required this.email,
    required this.fromSkill,
    required this.details,
    required this.toSkill,
  });

  // Factory constructor to create a Post object from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      email: json['Email'] ?? 'Unknown Email',
      fromSkill: json['FromSkill'] ?? 'Unknown Skill',
      details: json['Details'] ?? 'No Details',
      toSkill: json['ToSkill'] ?? 'Unknown Skill',
    );
  }
}

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  String searchQuery = "";
  List<Post> _posts = [
    Post(
      email: "john.doe@example.com",
      fromSkill: "Python",
      details: "Looking for help with a data analysis project using Python.",
      toSkill: "Data Analysis",
    ),
    Post(
      email: "jane.smith@example.com",
      fromSkill: "Web Development",
      details: "Seeking a front-end developer to build a responsive website.",
      toSkill: "Frontend Development",
    ),
    Post(
      email: "mic.jones@example.com",
      fromSkill: "Graphic Design",
      details: "Need assistance with designing a new logo for my startup.",
      toSkill: "Graphic Design",
    ),
    Post(
      email: "emily.clark@example.com",
      fromSkill: "Digital Marketing",
      details: "Looking for help with social media marketing strategies.",
      toSkill: "Marketing",
    ),
  ];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.oange,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value; // Update search query
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: AppColors.greySHADE800.withOpacity(0.2),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // Loading or Posts List
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: _posts
                              .where((post) =>
                                  post.fromSkill
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()) ||
                                  post.toSkill
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()))
                              .toList()
                              .asMap() // Use asMap to get index
                              .map((index, post) {
                                return MapEntry(
                                    index, _buildSearchResultCard(post, index));
                              })
                              .values
                              .toList(),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultCard(Post post, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5, // Shadow to create depth
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          // Navigate to PostDetails screen, passing the post data
          DefaultAnim(context, PostDetails());
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile picture or placeholder
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Skill and email information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.fromSkill,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "By: ${post.email}",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Post details text
              Text(
                post.details,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              // Skill exchange part
              Row(
                children: [
                  Icon(
                    Icons.compare_arrows,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Exchange: ${post.toSkill}",
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
