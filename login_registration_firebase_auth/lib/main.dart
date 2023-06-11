import 'package:flutter/material.dart';
import 'package:login_registration_firebase_auth/auth.dart';
import 'package:login_registration_firebase_auth/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_registration_firebase_auth/screens/login-screen.dart';
import 'package:login_registration_firebase_auth/screens/registration_screen.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: Auth(),
      routes: {
        "/": (context)=>Auth(),
        "/home": (context)=>HomeScreen(),
        "/signUp" :(context) => SignUp(),
        "/login" : (context)=>LoginScreen(),
      },

    );
  }
}
