// 📌 Purpose: About Us Page showing app purpose and team information

// ignore_for_file: deprecated_member_use

import 'package:ecommerce_app/core/utils/constants/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart';

import 'package:ecommerce_app/profile/controller/profile_controller.dart';

class AboutUsScreen extends ConsumerWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileControllerProvider);
    final displayName = user?.displayName ?? "Guest";

    return Scaffold(
      backgroundColor: lightPink,
      appBar: const CustomAppBar(title: 'About Us'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 👤 Welcome Message
          Text(
            'Welcome, $displayName 👋',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: deepChocolate,
            ),
          ),
          const SizedBox(height: 20),

          // 🧾 App Description
          Text(
            'Who We Are',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: deepChocolate,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'This app was developed with passion by a team of motivated computer science students. '
            'Our goal is to deliver a smooth e-commerce experience with great performance and a beautiful design.',
            style: TextStyle(fontSize: 14, color: mochaBrown),
          ),

          const SizedBox(height: 30),

          // 👥 Team Section
          Text(
            'Our Team',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: deepChocolate,
            ),
          ),
          const SizedBox(height: 16),
          _buildTeamMember(
            "Youssef Moussa",
            "Founder & Team Lead",
            'assets/images/youssef_moussa.jpg',
          ),
          _buildTeamMember("Mohamed Hashem", "Backend Engineer", ''),
          _buildTeamMember("Mohamed Farag", "UI/UX Designer", ''),
          _buildTeamMember("Ahmed Karam", "Mobile Developer", ''),
          _buildTeamMember("Moaaz Ragab", "Software Engineer", ''),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String profileImage) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: softRose,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage: profileImage.isNotEmpty
                ? AssetImage(profileImage)
                : null,
            child: profileImage.isEmpty
                ? const Icon(Icons.person, color: deepChocolate)
                : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: deepChocolate,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role.isNotEmpty ? role : "Team Member",
                style: TextStyle(color: mochaBrown, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
