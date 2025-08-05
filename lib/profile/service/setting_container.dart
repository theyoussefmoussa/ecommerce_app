import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/core/utils/constants/snackbar_utils.dart'; 

class SettingsController {
  /// Deletes the currently signed-in Firebase user.
  static Future<void> deleteAccount(BuildContext context, WidgetRef ref) async {
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

        if (context.mounted) {
          CustomSnackBar.show(
            context,
            "Account deleted successfully.",
            SnackBarType.success,
          );
          // Optional: Navigate to welcome/login page
        }
      } else {
        if (context.mounted) {
          CustomSnackBar.show(
            context,
            "No user is currently logged in.",
            SnackBarType.info,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.show(
          context,
          "Failed to delete account: ${e.toString()}",
          SnackBarType.error,
        );
      }
    }
  }
}
