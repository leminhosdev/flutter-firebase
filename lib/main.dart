import 'package:babylon/screens/home_screen.dart';
import 'package:babylon/screens/login.dart';
import 'package:babylon/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(), 
        '/signup': (context) => SignUp()
      },
    );
  }
}
