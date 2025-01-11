import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/rajdeep-logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 32.0),

              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 50, 174),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 81, 78, 78),
                ),
              ),
              const SizedBox(height: 32.0),

              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon:
                      Icon(Icons.email, color: Color.fromARGB(255, 1, 50, 174)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 16.0),

              // Password TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon:
                      Icon(Icons.lock, color: Color.fromARGB(255, 1, 50, 174)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 8.0),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle Forgot Password
                    print("Forgot Password clicked");
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromARGB(255, 1, 50, 174)),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Login
                    Navigator.pushNamed(context, "Dashboard");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    backgroundColor: Color.fromARGB(255, 1, 50, 174),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Signup Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle Signup
                    print("Sign Up clicked");
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 50, 174),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 50, 174),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 8,
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: screenWidth / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                //   Image.asset(
                // "assets/images/rajdeep-logo.png",
                // height: 100,
                // width: 100,
                // ),
              ),
            ),
            square(-40, 0.12),
            square(-22, 0.3),
            square(-5, 1),
            Positioned(
              top: screenHeight / 2.9,
              left: screenWidth / 2.9,
              child: Image.asset(
                "assets/images/rajdeep-logo.png",
                height: 130,
                width: 130,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight / 2,
                width: screenWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Image.asset(
                        //   "assets/images/rajdeep-logo.png",
                        //   height: 100,
                        //   width: 100,
                        // ),
                        textField("Email", Icons.email_outlined, false),
                        textField("Password", Icons.lock_outlined, true),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle Forgot Password
                              print("Forgot Password clicked");
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 1, 50, 174)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, "Dashboard"),
                          child: Container(
                            width: screenWidth,
                            height: 50,
                            margin: const EdgeInsets.only(
                              bottom: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 1, 50, 174),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: "Create one",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 1, 50, 174),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String hint, IconData icon, bool password) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        obscureText: password,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 1, 50, 174),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 1, 50, 174),
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black26,
          ),
          contentPadding: const EdgeInsets.only(
            top: 14,
          ),
        ),
      ),
    );
  }

  Widget square(double y, double opacity) {
    return Center(
      child: Transform.translate(
        offset: Offset(screenWidth / 30, y),
        child: Transform.rotate(
          angle: -0.4,
          child: Container(
            height: screenHeight / 3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(55),
            ),
          ),
        ),
      ),
    );
  }
}
