import 'package:flutter/material.dart';
import 'package:openbravo/app_config/app_route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // await InitialBinding().initialBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Openbravo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: 'splash',
      // builder: EasyLoading.init(),
      onGenerateRoute: AppRoute.allRoutes,
      navigatorKey: navigatorKey,
      // theme: WAppTheme.lightTheme,
      // darkTheme: WAppTheme.darkTheme,
    );
  }
}
