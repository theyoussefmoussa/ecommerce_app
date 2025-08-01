import 'package:ecommerce_app/core/utils/constants/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/constants/snackbar_utils.dart';
import 'package:ecommerce_app/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.read(profileControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Settings'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            tileColor: const Color(0xFFF2F2F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey),
            ),
            onTap: () {
              _handleLogout(context, profileController);
            },
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            tileColor: const Color(0xFFFDEAEA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.red),
            ),
            onTap: () {
              _confirmDeleteAccount(context, profileController);
            },
          ),
        ],
      ),
    );
  }

  void _handleLogout(BuildContext context, ProfileController controller) async {
    await controller.logout();

    if (!context.mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _confirmDeleteAccount(
    BuildContext context,
    ProfileController controller,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Delete Account",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Are you sure you want to delete your account? This action cannot be undone.",
          style: TextStyle(color: Colors.black87),
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
      await controller.deleteAccount();

      if (!context.mounted) return;

      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
      CustomSnackBar.show(
        context,
        'Account deleted successfully.',
        SnackBarType.success,
      );
    } catch (e) {
      if (!context.mounted) return;

      CustomSnackBar.show(context, 'Error: $e', SnackBarType.error);
    }
  }
}
