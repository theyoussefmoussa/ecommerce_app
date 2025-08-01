// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart' as app_colors;

class TeamMemberTile extends StatelessWidget {
  final String name;
  final String role;
  final String profileImage;

  const TeamMemberTile({
    super.key,
    required this.name,
    required this.role,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: app_colors.softRose,
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
            backgroundImage:
                profileImage.isNotEmpty ? AssetImage(profileImage) : null,
            child: profileImage.isEmpty
                ? const Icon(Icons.person, color: app_colors.deepChocolate)
                : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: app_colors.deepChocolate,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role.isNotEmpty ? role : "Team Member",
                style: TextStyle(color: app_colors.mochaBrown, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
