import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:greatedays/src/provider/chat/chat_provider.dart';
import 'package:greatedays/src/screen/auth/login_screen.dart';
import 'package:greatedays/src/screen/chat/chat_wrapper.dart';
import 'package:greatedays/src/screen/main_wrapper.dart';
import 'package:provider/provider.dart';

class MainRouter {
  late GoRouter _mainRouter;
  GoRouter get main => _mainRouter;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late CalendarProvider _calendarProvider;
  late ChatProvider _chatProvider;

  MainRouter() {
    _calendarProvider = CalendarProvider();
    _chatProvider = ChatProvider();

    _mainRouter = GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'main',
          builder: (context, state) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: _calendarProvider),
              ],
              child: const MainWrapperScreen(),
            );
          },
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
        path: "chat/:diaryId",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final diaryId = state.pathParameters['diaryId']!;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: _calendarProvider),
              ChangeNotifierProvider.value(value: _chatProvider),
            ],
            child: ChatWrapperScreen(diaryId: diaryId),
          );
        },
      ),
      GoRoute(
        name: "new-chat",
        path: "chat",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: _calendarProvider),
              ChangeNotifierProvider.value(value: _chatProvider),
            ],
            child: const ChatWrapperScreen(),
          );
        },
      ),
    ];
  }
}
