import 'package:flutter/material.dart';
import 'package:openbravo/app_pages/user_info/widget/form_submit.dart';
import 'package:openbravo/app_utils/index_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenHeight = 0;
  double screenWidth = 0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Image.asset(
                          //   "assets/images/rajdeep-logo.png",
                          //   height: 100,
                          //   width: 100,
                          // ),
                          textField(
                              "Email", Icons.email_outlined, false, email),
                          textField(
                              "Password", Icons.lock_outlined, true, password),

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
                    ),
                    Column(
                      children: [
                        FormSubmit(
                          email: email,
                          password: password,
                          screenWidth: screenWidth,
                          formKey: _formKey,
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

  Widget textField(
      String hint, IconData icon, bool password, TextEditingController val) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        controller: val,
        obscureText: password,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => password
            ? WValidator.validatePassword(value)
            : WValidator.validateEmail(value),
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
