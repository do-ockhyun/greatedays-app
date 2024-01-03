import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:greatedays/src/routes/main_router.dart';
import 'package:greatedays/src/utils/local_storage.dart';

void main() async {
  debugRepaintRainbowEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  // load Store
  await LocalStorage().ready();

  // 가로모드 방지
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(useMaterial3: true),
      routerConfig: MainRouter().main,
    );
  }
}
