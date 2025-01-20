import 'package:flutter/material.dart';
import 'package:openbravo/app_utils/helpers/alert_function.dart';

import '../service/login_service.dart';

class FormSubmit extends StatelessWidget {
  const FormSubmit({
    super.key,
    required this.email,
    required this.password,
    required this.screenWidth,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final TextEditingController email;
  final TextEditingController password;
  final double screenWidth;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (LoginService().login(email, password, context, _formKey)) {
          AlertService().hideLoadingDialog(context);
          Navigator.pushNamed(context, "Dashboard");
        } else {
          // AlertService().showLoadingDialog(context);
          AlertService().errorToast('Mismatch Credentials');
        }
      },
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
    );
  }
}
