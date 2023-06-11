import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers to save the value of the textField
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() { // to dispose controllers if i didn't use it
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());

  }
  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed("/signUp");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          SizedBox(height: 100),
          //title
          Center(
            child: Text(
              "SIGN IN",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          SizedBox(height: 50),
          // email
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          //password
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          //sign in button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                signIn();
              },
              child: Text("Sign in"),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                backgroundColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 60),
              ),

            ),
          ),
          // sign up link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not yet a member?", style: TextStyle(color: Colors.white, fontSize: 22)),
              TextButton(
                onPressed: () {
                  openSignUpScreen();

                },
                child: Text("Sign up", style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
            ],
          ),
        ],
      ),
    );
  }




}
