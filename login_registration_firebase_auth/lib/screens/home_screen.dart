import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("home page", style: TextStyle(fontSize: 22),),
          Text(user!.email!),
          MaterialButton(
              onPressed: (){FirebaseAuth.instance.signOut();},
            color: Colors.red,
            child: Text("LogOut"),
            textColor: Colors.white,
          ),
        ],
      ),
    ),

    );
  }
}
