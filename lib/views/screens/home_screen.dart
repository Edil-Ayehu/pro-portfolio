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
        height: isMobile ? 600 : 700,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: controller.isDarkMode
                ? [
                    const Color(0xFF1A237E),
                    const Color(0xFF4A148C),
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
            child: isMobile
                ? _buildMobileHeader(controller.isDarkMode)
                : _buildDesktopHeader(controller.isDarkMode),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopHeader(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Hello, I'm",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Edilayehu Tadesse",
                style: GoogleFonts.poppins(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Flutter & React Developer",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Crafting beautiful, responsive, and user-friendly applications\nwith a passion for clean code and innovative solutions.",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  _buildSocialButton(
                    CupertinoIcons.gift,
                    "GitHub",
                    isDarkMode,
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    CupertinoIcons.link,
                    "LinkedIn",
                    isDarkMode,
                  ),
                  const SizedBox(width: 20),
                  _buildResumeButton(isDarkMode),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(bool isDarkMode) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(size: 200),
        const SizedBox(height: 30),
        Text(
          "👋 Hello, I'm",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Edilayehu Tadesse",
          style: GoogleFonts.poppins(
            fontSize: 30,
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
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          "Flutter & React Developer",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Crafting beautiful, responsive apps with clean code",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              CupertinoIcons.gift,
              "GitHub",
              isDarkMode,
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              CupertinoIcons.link,
              "LinkedIn",
              isDarkMode,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildResumeButton(isDarkMode),
      ],
    );
  }

  Widget _buildProfileImage({double? size}) {
    return Container(
      width: size ?? 400,
      height: size ?? 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/ed.JPG',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildResumeButton(bool isDarkMode) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add resume download or view logic
      },
      icon: const Icon(
        Icons.download_rounded,
        color: Colors.white,
      ),
      label: Text(
        "Download CV",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700],
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        elevation: 0,
      ).copyWith(
        overlayColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.1),
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
