import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/auth_provider.dart';
import 'package:greatedays/src/screen/auth/login_screen.dart';
import 'package:greatedays/src/screen/home_screen.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen>
    with WidgetsBindingObserver {
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        logger.t('resumed');
        break;
      case AppLifecycleState.inactive:
        logger.t('inactive');
        break;
      case AppLifecycleState.detached:
        logger.t('detached');
        break;
      case AppLifecycleState.paused:
        logger.t('paused');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MultiProvider(
          providers: [
            Provider<AuthProvider>(create: (_) => AuthProvider()),
          ],
          child: Builder(
            builder: (context) {
              if (context.select((AuthProvider a) => a.isAuth)) {
                return const HomeScreen();
              }
              return const LoginScreen();
            },
          ),
        );
      },
    );
  }
}
