import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controllers to save the value of the textField
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // to dispose controllers if i didn't use it
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  Future signUp() async {
  if( _passwordController.text.trim() == _confirmPasswordController.text.trim() ){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    Navigator.of(context).pushReplacementNamed('/');
  }else{
print("password and confirm password must be the same");
  }
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          SizedBox(height: 70),
          //title
          Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          SizedBox(height: 25),
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
          //confirm Password
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
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm Password',
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
                signUp();
              },
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
              Text("Already a member?",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              TextButton(
                onPressed: () {
                  openSignInScreen();
                },
                child: Text("Sign in",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

