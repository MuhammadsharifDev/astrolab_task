import 'package:astrolabb_task/src/routes/approutes.dart';
import 'package:astrolabb_task/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const KeyboardDismisser(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

