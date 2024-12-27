import 'package:flutter/material.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/PostFragment/create_post.dart';
import 'package:skills_swap/presentation/fragments/PostFragment/see_post_details.dart';

// Post model
class Post {
  final String title;
  final String content;
  final String author;
  final String toSkill;

  Post({
    required this.title,
    required this.content,
    required this.author,
    required this.toSkill,
  });

  // Factory constructor to create a Post object from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['FromSkill'] ?? 'Unknown Skill',
      content: json['Details'] ?? '',
      author: json['Email'] ?? 'Anonymous',
      toSkill: json['ToSkill'] ?? 'Unknown Skill',
    );
  }
}

class PostFragment extends StatefulWidget {
  const PostFragment({super.key});

  @override
  State<PostFragment> createState() => _PostFragmentState();
}

class _PostFragmentState extends State<PostFragment> {
  Future<List<Post>>? _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchSamplePosts();
  }

  Future<List<Post>> fetchSamplePosts() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      Post(
        title: "Learn Flutter",
        content: "I want to learn Flutter in exchange for React skills.",
        author: "Athar Ibrahim",
        toSkill: "React",
      ),
      Post(
        title: "Master Python",
        content: "Can teach JavaScript for Python expertise.",
        author: "Athar Ibrahim",
        toSkill: "JavaScript",
      ),
      Post(
        title: "UI/UX Design",
        content:
            "Looking to improve my UI/UX skills for my Project,Looking to improve my UI/UX skills for my Project",
        author: "Athar Ibrahim",
        toSkill: "Graphic Design",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load posts. Please try again later.",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No posts available.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    DefaultAnim(context, SeePostDetails(post: posts[index]));
                  },
                  child: Card(
                    color: AppColors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width:
                                    50, // Adjust width to match the radius * 2 of CircleAvatar
                                height:
                                    50, // Adjust height to match the radius * 2 of CircleAvatar
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.withOpacity(0.9),
                                      Colors.pink.withOpacity(0.9),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    posts[index].author[0],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    posts[index].author,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Seeking: ${posts[index].toSkill}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            posts[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            maxLines: 2,
                            posts[index].content,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
        child: FloatingActionButton(
          onPressed: () {
            DefaultAnim(context, CreatePost());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.pink,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          tooltip: "Create Post",
        ),
      ),
    );
  }
}
