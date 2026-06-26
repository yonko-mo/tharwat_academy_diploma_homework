import 'package:flutter/material.dart';
import 'package:grocery_app/features/splash/presentation/ui/splash_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferencesSingleton.init();
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
