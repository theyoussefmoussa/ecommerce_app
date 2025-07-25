// 📌 Purpose: Manages user profile state and account actions using Firebase Auth

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, User?>((ref) {
      return ProfileController();
    });

class ProfileController extends StateNotifier<User?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileController() : super(FirebaseAuth.instance.currentUser) {
    _auth.authStateChanges().listen((user) => state = user);
  }

  Future<void> logout() async {
    await _auth.signOut();
    state = null;
  }

  Future<void> updateDisplayName(String name) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updateDisplayName(name);
      await user.reload();
      state = _auth.currentUser;
    }
  }

  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.delete();
      state = null;
    } else {
      throw Exception("No user is currently signed in.");
    }
  }
}
