import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_pro/core/themes/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeProvider themeProvider = Get.find<ThemeProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(constraints),
                _buildAboutSection(constraints),
                _buildTechStackSection(constraints),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;
    
    return Container(
      height: isMobile ? 500 : 700,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
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
                "Hello, I'm [Your Name]",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 30 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Flutter & React Developer",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 20 : 32,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(CupertinoIcons.gift, "GitHub"),
                  const SizedBox(width: 20),
                  _buildSocialButton(CupertinoIcons.link, "LinkedIn"),
                ],
              ),
              IconButton(
                onPressed: () {
                  themeProvider.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                  );
                },
                icon: Icon(
                  Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 24 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "I'm a passionate developer specializing in creating beautiful and functional applications using Flutter and React. With expertise in both mobile and web development, I bring ideas to life through clean code and intuitive design.",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 18,
              color: Colors.grey[700],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTechStackSection(BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            "Tech Stack",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 24 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildTechCard("Flutter", Icons.flutter_dash),
              _buildTechCard("React", Icons.code),
              _buildTechCard("Firebase", Icons.local_fire_department),
              _buildTechCard("Node.js", Icons.abc),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        side: const BorderSide(color: Colors.white),
      ),
    );
  }

  Widget _buildTechCard(String title, IconData icon) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue[900]),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
