import 'package:flutter/material.dart';
import 'package:openbravo/app_utils/constants/colors.dart';
import 'package:openbravo/app_utils/helpers/helper_functions.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:my_store/utils/constants/colors.dart';
// import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomLoaders {
  static hideSnackbar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: WHelperFunctions.isDarkMode(context)
                ? WColors.darkerGrey.withOpacity(0.9)
                : WColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        )));
  }

  static successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check, color: WColors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: WColors.white,
                      fontWeight: FontWeight.bold,
                    )),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: WColors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: WColors.primary,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
    ));
  }

  static warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Icons.warning_amber_sharp, color: WColors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: WColors.white,
                      fontWeight: FontWeight.bold,
                    )),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: WColors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: WColors.warning,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    ));
  }

  static errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Icons.warning_amber_sharp, color: WColors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: WColors.white,
                      fontWeight: FontWeight.bold,
                    )),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: WColors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red.shade600,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    ));
    debugPrint('Error Snack Bar: $message');
  }
}
