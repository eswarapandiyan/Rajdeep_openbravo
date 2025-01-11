import 'package:flutter/material.dart';
// import '../../app_utils/index_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getRoute();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getRoute() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dark = WHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                height: 300,
                child: Image.asset("assets/images/rajdeep-logo.png")),
            const SizedBox(height: 24.0),
            // SpinKitFadingCube(
            //   itemBuilder: (BuildContext context, int index) {
            //     return DecoratedBox(
            //       decoration: BoxDecoration(
            //         color: dark
            //             ? const Color.fromARGB(255, 192, 201, 195)
            //             : WColors.primary,
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
