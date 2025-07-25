// 📌 Purpose: Displays the user profile UI (name, email, avatar, edit button)

import 'package:ecommerce_app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/profile/controller/profile_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xff6b63ff),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/vector-users-icon.jpg',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.displayName ?? 'Guest User',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Text(
              user?.email ?? 'user@example.com',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              onPressed: () =>
                  Navigator.pushNamed(context, '/editProfileScreen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6b63ff),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                shadowColor: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildAppInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Card(
      color: Color(0xff6b63ff),
      elevation: 3,
      shadowColor: Color(0xff6b63ff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.info,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              title: Text(
                'App Version',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '1.0.0',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.support_agent,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              title: Text(
                'Support',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'yosefmusa91@gmail.com',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
