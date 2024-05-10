import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prak_tpm_api/screens/home_screen.dart';
import 'package:prak_tpm_api/screens/main_wrapper.dart';
import 'package:prak_tpm_api/screens/profile_screen.dart';
import 'package:prak_tpm_api/screens/sign_in_screen.dart';
import 'package:prak_tpm_api/screens/sign_up_screen.dart';
import 'package:prak_tpm_api/screens/splash_screen.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/splash";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorProfile = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// Splash Screen
      GoRoute(
        path: "/splash",
        name: "splash",
        builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
      ),

      /// SignUp
      GoRoute(
        path: "/signup",
        name: "signup",
        builder: (BuildContext context, GoRouterState state) => const SignUpPage(),
      ),

      /// SignIn
      GoRoute(
        path: "/signin",
        name: "signin",
        builder: (BuildContext context, GoRouterState state) => const SignInPage(),
      ),

      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "home",
                builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
              ),
            ],
          ),

          /// Profile
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: "/profile",
                name: "profile",
                builder: (BuildContext context, GoRouterState state) =>
                const ProfilePage(),
              ),
            ],
          ),

        ],
      ),
    ],
  );
}