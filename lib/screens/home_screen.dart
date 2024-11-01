import 'package:babylon/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  Future<void> signOut(BuildContext context) async {
    await _authService.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentUser != null) ...[
              Text(
                'Hey, ${currentUser.displayName ?? 'User'}! You’re successfully logged in.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => signOut(context),
                child: Text('Logout'),
              ),
            ] else ...[
              Text(
                'You are not logged in.',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
