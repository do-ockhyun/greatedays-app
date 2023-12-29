import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greatedays/src/screen/auth/login_screen.dart';
import 'package:greatedays/src/screen/chat/chat_screen.dart';
import 'package:greatedays/src/screen/main_wrapper.dart';

class MainRouter {
  late GoRouter _mainRouter;
  GoRouter get main => _mainRouter;

  MainRouter() {
    _mainRouter = GoRouter(
      initialLocation: '/',
      // navigatorKey: AppKeys.rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'main',
          builder: (context, state) => const MainWrapperScreen(),
          routes: subRoutes(),
        ),

        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return const LoginScreen();
          },
        ),

        //
      ],

      redirect: (context, state) {
        return null;

        //
      },

      /*
      * 
      */
      errorPageBuilder: (context, state) {
        return const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text('Error Page'),
            ),
          ),
        );
      },
    );
  }

  List<RouteBase> subRoutes() {
    return [
      GoRoute(
        name: "chat",
        path: "chat",
        builder: (context, state) {
          return const ChatScreen();
        },
      ),
    ];
  }
}
