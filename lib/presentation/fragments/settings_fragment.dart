import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_swap/animations/default_anim.dart';
import 'package:skills_swap/animations/success_anim.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/auth/sign_in/signin_screen.dart';
import 'package:skills_swap/presentation/fragments/SettingsFragment/edit_account.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment({super.key});

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  ImageProvider? _retrievedImage;
  bool _isDarkMode = false; // Example setting for dark mode
  bool _isNotificationsEnabled = true; // Example setting for notifications
  double _fontSize = 14.0; // Example setting for font size

  // Logout System
  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored preferences
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange, Colors.pink], // Customize gradient colors
            ),
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Section
              _buildProfileSection(),
              const SizedBox(height: 20),

              // Settings List
              _buildSettingsList(),
            ],
          ),
        ),
      ),
    );
  }

  // Profile section with user info
  Widget _buildProfileSection() {
    return Card(
      color: const Color.fromARGB(255, 245, 245, 245),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: _retrievedImage != null
              ? _retrievedImage!
              : const AssetImage("assets/images/person5.jpeg"),
        ),
        title: Text(
          "Athar Ibrahim",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text('aikpak24@gmail.com'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Handle edit profile logic
            DefaultAnim(context, EditAccount());
          },
        ),
      ),
    );
  }

  // List of settings options
  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingItem(
          icon: Icons.brightness_6,
          title: "Dark Mode",
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient background
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: _isDarkMode
                        ? LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.pink
                            ], // Gradient for active state
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.white
                            ], // Gradient for inactive state
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                ),
                // Switch widget
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                  activeColor: AppColors.transparent
                      .withOpacity(1), // Disable the default active color
                  inactiveThumbColor: Colors
                      .transparent, // Disable the default inactive thumb color
                ),
              ],
            ),
          ),
        ),
        _buildSettingItem(
          icon: Icons.notifications,
          title: "Notifications",
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                _isNotificationsEnabled = !_isNotificationsEnabled;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient background
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: _isNotificationsEnabled
                        ? LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.pink
                            ], // Gradient for active state
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.white
                            ], // Gradient for inactive state
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                ),
                // Switch widget
                Switch(
                  value: _isNotificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isNotificationsEnabled = value;
                    });
                  },
                  activeColor: AppColors.transparent
                      .withOpacity(1), // Disable the default active color
                  inactiveThumbColor: Colors
                      .transparent, // Disable the default inactive thumb color
                ),
              ],
            ),
          ),
        ),
        _buildSettingItem(
          icon: Icons.text_fields,
          title: "Font Size",
          trailing: DropdownButton<double>(
            value: _fontSize,
            items: const [
              DropdownMenuItem(value: 12.0, child: Text("Small")),
              DropdownMenuItem(value: 14.0, child: Text("Medium")),
              DropdownMenuItem(value: 16.0, child: Text("Large")),
            ],
            onChanged: (value) {
              setState(() {
                _fontSize = value ?? _fontSize;
              });
            },
          ),
        ),
        _buildSettingItem(
          icon: Icons.account_circle,
          title: "Account",
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Navigate to account settings
              DefaultAnim(context, EditAccount());
            },
          ),
        ),
        _buildSettingItem(
          icon: Icons.help_outline,
          title: "Help & Support",
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Navigate to help section
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        // Logout Button
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
            onPressed: () async {
              // Clear login session
              await logoutUser();

              // Navigate to the SigninScreen
              SuccessAnim(context, SigninScreen());
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        SizedBox(
          height: 48,
        ),
        Text("Version 1.0.0"),
        SizedBox(
          height: 48,
        ),
      ],
    );
  }

  // Reusable setting item widget
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {
    return Card(
      color: const Color.fromARGB(255, 245, 245, 245),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}
