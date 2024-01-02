import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //

  Widget googleLogin() {
    return InkWell(
      onTap: () {
        context.read<AuthProvider>().storeToken("mock-user-token");
      },
      child: Container(
        height: 40,
        width: 200,
        margin: const EdgeInsets.all(8),
        color: Colors.red[100],
        child: const Center(child: Text("GOOGLE LOGIN")),
      ),
    );
  }

  Widget appleLogin() {
    return InkWell(
      onTap: () {
        context.read<AuthProvider>().storeToken("mock-user-token");
      },
      child: Container(
        height: 40,
        width: 200,
        margin: const EdgeInsets.all(8),
        color: Colors.blue[100],
        child: const Center(child: Text("APPLE LOGIN")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logo_dev_outlined, size: 100),
              googleLogin(),
              appleLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
