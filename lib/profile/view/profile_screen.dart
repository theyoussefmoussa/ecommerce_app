// ignore_for_file: deprecated_member_use, unused_element

import 'package:ecommerce_app/app_router.dart';
import 'package:ecommerce_app/core/utils/catitalize_all_words.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart';
import 'package:ecommerce_app/core/utils/constants/custom_app_bar.dart';
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
      appBar: CustomAppBar(
        title: 'My Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
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
              user?.displayName?.trim().isNotEmpty ?? false
                  ? 'Welcome back, ${capitalizeAllWords(user!.displayName!)} 👋'
                  : 'Welcome, Guest 👤',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D1A31),
              ),
            ),

            Text(
              user?.email ?? 'user@example.com',
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              onPressed: () =>
                  Navigator.pushNamed(context, '/editProfileScreen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: maincolor,
                foregroundColor: Colors.white,
                shadowColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildAppInfoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfoCard(BuildContext context) {
    return Card(
      color: maincolor,
      elevation: 3,
      shadowColor: maincolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text(
                'App Version',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text('1.0.0', style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(Icons.support_agent, color: Colors.white),
              title: Text(
                'Support',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'yosefmusa91@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/aboutUsScreen'),
              child: Container(
                decoration: BoxDecoration(
                  color: maincolor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const ListTile(
                  leading: Icon(Icons.info, color: Colors.white, size: 20),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Learn about the app and the team',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: softRose,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: mochaBrown.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: mochaBrown, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: deepChocolate,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            subtitle,
            style: TextStyle(color: mochaBrown, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
