import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthProvider>().storeToken("mock-user-token");
          },
          child: const Text("login"),
        ),
      ),
    );
  }
}
