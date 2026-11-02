import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/secure_storage_service.dart';

void main() async {
  // async
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await SecureStorageService().hasToken();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Storage & HTTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // kalau sudah ada token -> Home, kalau belum -> Login
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
