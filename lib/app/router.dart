import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/pages/splash_page.dart';
import '../features/authentication/presentation/pages/login_option_page.dart';
import '../features/authentication/presentation/pages/login_page.dart';
import '../features/authentication/presentation/pages/register_page.dart';
import '../features/home/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',

  routes: [

    /// Splash Screen
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),

    /// Login Options Screen
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginOptionPage(),
    ),

    /// Sign In Screen
    GoRoute(
      path: '/signin',
      builder: (context, state) => const LoginPage(),
    ),

    /// Register Screen
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    /// Home Screen
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);