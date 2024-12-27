import 'package:flutter/material.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/fragments/MessageFragment/message_room.dart';

class MessageFragment extends StatefulWidget {
  const MessageFragment({super.key});

  @override
  State<MessageFragment> createState() => _MessageFragmentState();
}

class _MessageFragmentState extends State<MessageFragment> {
  final List<Map<String, String>> messages = [
    {
      "name": "John Doe",
      "message": "Hey, how's it going?",
      "time": "2:45 PM",
      "avatar": "assets/images/person1.jpeg"
    },
    {
      "name": "Jane Smith",
      "message": "Looking forward to our meeting tomorrow!",
      "time": "1:15 PM",
      "avatar": "assets/images/person2.jpeg"
    },
    {
      "name": "Mark Wilson",
      "message": "Thanks for sharing the document.",
      "time": "11:30 AM",
      "avatar": "assets/images/person3.jpg"
    },
    {
      "name": "Emily Clark",
      "message": "Let's catch up soon!",
      "time": "9:00 AM",
      "avatar": "assets/images/person4.jpg"
    },
    {
      "name": "Michael Johnson",
      "message": "Can you review my proposal?",
      "time": "8:30 AM",
      "avatar": "assets/images/person5.jpeg"
    },
    {
      "name": "Sarah Lee",
      "message": "Don't forget our call at 5 PM.",
      "time": "Yesterday",
      "avatar": "assets/images/person1.jpeg"
    },
    // Add more mock messages here
  ];

  // Filtered list based on search query
  List<Map<String, String>> filteredMessages = [];

  // Controller for the search field
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filteredMessages with all messages initially
    filteredMessages = messages;

    // Add listener to search input to update filteredMessages as user types
    searchController.addListener(() {
      filterMessages();
    });
  }

  // Method to filter messages based on the search term
  void filterMessages() {
    String query = searchController.text.toLowerCase();

    setState(() {
      filteredMessages = messages.where((message) {
        return message["name"]!.toLowerCase().contains(query) ||
            message["message"]!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(200, 255, 153, 0),
                    Color.fromARGB(200, 233, 30, 98),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                          searchController, // Set the controller for the search field
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.transparent.withOpacity(0),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
                    onPressed: () {
                      // Add voice search functionality here
                    },
                  ),
                ],
              ),
            ),
          ),

          // Message List
          Expanded(
            child: ListView.builder(
              itemCount: filteredMessages.length,
              itemBuilder: (context, index) {
                final message = filteredMessages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(message["avatar"]!),
                    radius: 25,
                  ),
                  title: Text(
                    message["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    message["message"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    message["time"]!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    // Implement navigation to chat screen
                    DefaultAnim(context, MessageRoom());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
