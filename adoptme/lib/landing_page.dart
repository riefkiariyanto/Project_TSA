import 'package:adoptme/login_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  // final VoidCallback showloginPage;
  // const LandingPage({super.key, required this.showloginPage});

  @override
  State<LandingPage> createState() => _landingPageState();
}

class _landingPageState extends State<LandingPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
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
              SizedBox(height: 75),

              //Hello !!
              new Image(
                image: new AssetImage("images/register.PNG"),
                width: 400.0,
                height: 320.0,
                fit: BoxFit.cover,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 75),
                  Text(
                    'Temukan ',
                    style: TextStyle(fontFamily: 'Gilroy', fontSize: 45),
                  ),
                  Text(
                    'Hewan ',
                    style: TextStyle(
                        color: Colors.blue, fontFamily: 'Gilroy', fontSize: 50),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 75),
                  Text(
                    'Impian Anda Di Sini',
                    style: TextStyle(fontFamily: 'Gilroy', fontSize: 45),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(showRegisterPage: toggleScreens)),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(17),
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
            ]),
          ),
        ),
      ),
    );
  }
}
