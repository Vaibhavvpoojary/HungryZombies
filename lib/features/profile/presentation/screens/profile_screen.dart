import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_option_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Top Profile Header
              const ProfileHeader(),

              const SizedBox(height: 20),

              // Account Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ProfileOptionTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.location_on_outlined,
                title: "Saved Addresses",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.payment_outlined,
                title: "Payment Methods",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.history,
                title: "Order History",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.favorite_border,
                title: "Favorites",
                onTap: () {},
              ),

              const SizedBox(height: 25),

              // App Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ProfileOptionTile(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.help_outline,
                title: "Help & Support",
                onTap: () {},
              ),

              ProfileOptionTile(
                icon: Icons.info_outline,
                title: "About Hungry Zombies",
                onTap: () {},
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logout later
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}