import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo Header
              DrawerHeader(
                child: Icon(
                  Icons.auto_fix_high,
                  color: Theme.of(context).colorScheme.primary,
                  size: 62,
                ),
              ),

              // Home Tile
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    // Pop the navigator
                    Navigator.pop(context);
                  },
                ),
              ),

              // Setting Tile
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    // Pop the navigator
                    Navigator.pop(context);

                    // Navigate to the setting page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SettingsPage(),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),

          // Logout Button Tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: Text(
                "L O G O U T",
                style: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.red.shade600,
              ),
              onTap: () {
                //
              },
            ),
          ),
        ],
      ),
    );
  }
}
