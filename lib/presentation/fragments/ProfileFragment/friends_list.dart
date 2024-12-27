import 'package:flutter/material.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/SearchFragment/profile_details.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  String searchQuery = ""; // To hold the search query

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 80),
          child: AppBar(
            toolbarHeight: 60,
            iconTheme: const IconThemeData(color: AppColors.white),
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 44, 16, 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: const TextStyle(color: Colors.white54),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white),
                            filled: true,
                            fillColor: AppColors.greySHADE800.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.mic, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                  child: const TabBar(
                    labelColor: AppColors.white,
                    unselectedLabelColor: Color.fromARGB(255, 195, 195, 195),
                    indicatorColor: AppColors.white,
                    tabs: [
                      Tab(text: 'Friends'),
                      Tab(text: 'Request'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: TabBarView(
            children: [
              _buildFriendsList(),
              _buildRequestList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFriendsList() {
    final List<Map<String, String>> friends = [
      {'email': 'Saif Ali', 'status': 'Friend since 2020'},
      {'email': 'Misdaq', 'status': 'Friend since 2021'},
      {'email': 'Ali', 'status': 'Friend since 2019'},
    ];

    // Only filter if search query is not empty
    final filteredFriends = searchQuery.isEmpty
        ? friends
        : friends
            .where((friend) => friend['email']!
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();

    // Check if no friends match the search query
    if (filteredFriends.isEmpty) {
      return Center(
        child: Text(
          "No friends found.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredFriends.length,
      itemBuilder: (context, index) {
        final friend = filteredFriends[index];

        return Card(
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: AppColors.greySHADE500,
          elevation: 4,
          child: InkWell(
            onTap: () {
              DefaultAnim(context, ProfileDetails());
            },
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // Circular Avatar Example
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 30, // Adjust size as needed
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/person5.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                friend['email']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text_black,
                ),
              ),
              subtitle: Text(friend['status']!),
              trailing: InkWell(
                onTap: () {
                  // Handle unfollow action here (e.g., remove from list)
                },
                child: Container(
                  height: 35,
                  width: 88,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "UnFollow",
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
          ),
        );
      },
    );
  }

  Widget _buildRequestList() {
    final List<Map<String, String>> requests = [
      {'from': 'Misdaq', 'status': 'Pending'},
      {'from': 'Ali', 'status': 'Pending'},
    ];

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return Card(
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: InkWell(
            onTap: () {
              DefaultAnim(context, ProfileDetails());
            },
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // Circular Avatar Example
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 30, // Adjust size as needed
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/person5.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                request['from']!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(request['status']!),
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    requests.removeAt(index);
                  });
                },
                child: Container(
                  height: 35,
                  width: 88,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Accept",
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
          ),
        );
      },
    );
  }
}
