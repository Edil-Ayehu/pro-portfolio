import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_pro/controllers/theme_controller.dart';

class HomeScreen extends GetView<ThemeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: controller.toggleTheme,
            icon: Obx(() => Icon(
                  controller.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: controller.isDarkMode ? Colors.white : Colors.black,
                )),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context, constraints),
                _buildAboutSection(context, constraints),
                _buildTechStackSection(context, constraints),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;

    return GetX<ThemeController>(
      builder: (controller) => Container(
        height: isMobile ? 500 : 700,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: controller.isDarkMode
                ? [
                    const Color(0xFF1A237E), // Darker blue
                    const Color(0xFF4A148C), // Darker purple
                  ]
                : [
                    Colors.blue.shade900,
                    Colors.purple.shade900,
                  ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello, I'm Edilayehu Tadesse",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 30 : 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Flutter & React Developer",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 32,
                    color: Colors.white.withOpacity(0.9),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      CupertinoIcons.gift,
                      "GitHub",
                      controller.isDarkMode,
                    ),
                    const SizedBox(width: 20),
                    _buildSocialButton(
                      CupertinoIcons.link,
                      "LinkedIn",
                      controller.isDarkMode,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, bool isDarkMode) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        side: BorderSide(
          color: isDarkMode ? Colors.white.withOpacity(0.8) : Colors.white,
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            "About Me",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 30),
          Text(
            "I'm a passionate developer specializing in creating beautiful and functional applications using Flutter and React. With expertise in both mobile and web development, I bring ideas to life through clean code and intuitive design.",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTechStackSection(
      BuildContext context, BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      color: controller.isDarkMode ? const Color(0xFF1E1E1E) : Colors.grey[100],
      child: Column(
        children: [
          Text(
            "Tech Stack",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildTechCard(context, "Flutter", Icons.flutter_dash),
              _buildTechCard(context, "React", Icons.code),
              _buildTechCard(context, "Firebase", Icons.local_fire_department),
              _buildTechCard(context, "Node.js", Icons.abc),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildSocialButton(IconData icon, String label) {
  //   return ElevatedButton.icon(
  //     onPressed: () {},
  //     icon: Icon(icon, color: Colors.white),
  //     label: Text(
  //       label,
  //       style: GoogleFonts.poppins(color: Colors.white),
  //     ),
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Colors.transparent,
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       side: const BorderSide(color: Colors.white),
  //     ),
  //   );
  // }

  Widget _buildTechCard(BuildContext context, String title, IconData icon) {
    return GetX<ThemeController>(
      builder: (controller) => Container(
        width: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: controller.isDarkMode ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: controller.isDarkMode
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 40,
                color: controller.isDarkMode
                    ? Colors.blue[400]
                    : Colors.blue[900]),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: controller.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
