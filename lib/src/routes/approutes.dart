import 'package:astrolabb_task/src/auth/login/bloc/login_bloc.dart';
import 'package:astrolabb_task/src/auth/login/login_page.dart';
import 'package:astrolabb_task/src/auth/signup/bloc/signup_bloc.dart';
import 'package:astrolabb_task/src/auth/signup/signup_page.dart';
import 'package:astrolabb_task/src/routes/route_name.dart';
import 'package:astrolabb_task/src/screens/main/bloc/main_bloc.dart';
import 'package:astrolabb_task/src/screens/main/main_page.dart';
import 'package:astrolabb_task/src/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginPage(),
          ),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: const SignupPage(),
          ),
        );
      case RoutesName.main:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MainBloc(),
            child: const MainPage(),
          ),
        );
    }
    return null;
  }
}