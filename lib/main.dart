import 'package:ecommerce_app/app_router.dart';
import 'package:ecommerce_app/auth/controller/auth_state_provider.dart';
import 'package:ecommerce_app/auth/view/welcome.dart';
import 'package:ecommerce_app/main_screen.dart';
import 'package:ecommerce_app/core/utils/constants/app_text_style.dart'
    as title;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title.AppTextStyle.appName,
      onGenerateRoute: AppRouter.generateRoute,

      home: authState.when(
        data: (user) {
          return user != null ? const MainScreen() : const Welcome();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stackTrace) =>
            Scaffold(body: Center(child: Text('Error: $error'))),
      ),
    );
  }
}
