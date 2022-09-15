import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => loginPageState();
}

class loginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _PasswordControoler = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _PasswordControoler.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _PasswordControoler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 75),

              //Hello !!
              Text(
                'Hello !',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'login for use',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),

              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true)),
              ),
              SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    obscureText: true,
                    controller: _PasswordControoler,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Passwword',
                        fillColor: Colors.white,
                        filled: true)),
              ),
              SizedBox(height: 10),

              //SignIn Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member ? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
