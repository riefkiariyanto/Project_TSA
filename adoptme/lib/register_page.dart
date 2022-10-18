import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _PasswordControoler = TextEditingController();
  final _ConfirmPaswordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _PasswordControoler.dispose();
    _ConfirmPaswordController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    //autenthicator user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _PasswordControoler.text.trim(),
      );
    }
    addUserDetails(
      _userNameController.text.trim(),
      _emailController.text.trim(),
      _cityController.text.trim(),
      int.parse(_phoneNumberController.text.trim()),
      int.parse(_ageController.text.trim()),
    );
  }

  Future addUserDetails(
    String userName,
    String email,
    String city,
    int phoneNumber,
    int age,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'user name': userName,
      'email': email,
      'no Phone': phoneNumber,
      'age': age,
      'city': city,
    });
  }

  bool passwordConfirmed() {
    if (_ConfirmPaswordController.text.trim() ==
        _ConfirmPaswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 25),

              //Hello !!
              new Image(
                image: new AssetImage("images/register.PNG"),
                width: 350.0,
                height: 270.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Hello !',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 50,
                ),
              ),
              Text(
                'Register for use !',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),

              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'User Name',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Number Phone',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Age',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'City',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),

              SizedBox(height: 10),
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
                        fillColor: Colors.grey[100],
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
                        hintText: 'Password',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(height: 10),

              //Confirm Pasword
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    obscureText: true,
                    controller: _ConfirmPaswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Confirm Password',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(height: 10),

              //SignIn Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
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
                    ' Punya akun  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Login Now',
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
