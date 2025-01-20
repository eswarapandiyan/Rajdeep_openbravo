import 'package:flutter/material.dart';
import 'package:openbravo/app_utils/index_utils.dart';

class LoginService {
  bool login(TextEditingController email, TextEditingController pass,
      BuildContext context, GlobalKey<FormState> formKey) {
    AlertService().showLoadingDialog(context);

    if (formKey.currentState!.validate() && pass.text == "Rajdeep@123") {
      AlertService().hideLoadingDialog(context);
      return true;
    } else {
      AlertService().hideLoadingDialog(context);
      return false;
    }
  }
}
