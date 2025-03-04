import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mytravel/screens/home_screen.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:mytravel/screens/sign_up_screen.dart';

import 'screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



bool show = true;
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool("ON BOARDING") ?? true;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Travel App 1.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: show ? const OnBoardingScreen() : SignInPage(),
    );
  }
}
