// lib/features/profile/controller/settings_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsController {
  /// Deletes the currently signed-in Firebase user.
  static Future<void> deleteAccount(BuildContext context, WidgetRef ref) async {
    // Ask confirmation before deleting
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "Are you sure you want to delete your account? This action cannot be undone.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        // ignore: use_build_context_synchronously
        _showSnackbar(context, "Account deleted successfully");
        // Optional: Navigate to welcome/login page
      } else {
        // ignore: use_build_context_synchronously
        _showSnackbar(context, "No user is currently logged in.");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      _showSnackbar(context, "Failed to delete account: ${e.toString()}");
    }
  }

  static void _showSnackbar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
