import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_pro/core/themes/app_theme.dart';
import 'package:portfolio_pro/core/themes/theme_provider.dart';
import 'package:portfolio_pro/firebase_options.dart';
import 'package:portfolio_pro/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.put(ThemeProvider());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Pro',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.theme,
      home: HomeScreen(),
    );
  }
}
