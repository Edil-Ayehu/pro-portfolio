import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_pro/controllers/theme_controller.dart';
import 'package:portfolio_pro/views/screens/about_screen.dart';
import 'package:portfolio_pro/views/screens/home_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentScreen;
  
  const CommonAppBar({
    Key? key,
    required this.currentScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavButton('Home', currentScreen == 'Home'),
          const SizedBox(width: 32),
          _buildNavButton('About', currentScreen == 'About'),
          const SizedBox(width: 32),
          _buildNavButton('Projects', currentScreen == 'Projects'),
          const SizedBox(width: 32),
          _buildNavButton('Contact', currentScreen == 'Contact'),
        ],
      ),
      actions: [
        GetX<ThemeController>(
          builder: (controller) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: controller.isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: controller.isDarkMode
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                ),
              ),
              child: IconButton(
                onPressed: controller.toggleTheme,
                icon: Icon(
                  controller.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: controller.isDarkMode ? Colors.white : Colors.black,
                  size: 20,
                ),
                tooltip: controller.isDarkMode ? 'Light Mode' : 'Dark Mode',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(String text, bool isActive) {
    return GetX<ThemeController>(
      builder: (controller) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            if (text != currentScreen) {
              switch (text) {
                case 'Home':
                  Get.off(() => HomeScreen());
                  break;
                case 'About':
                  Get.off(() => const AboutScreen());
                  break;
                // Add other cases as needed
              }
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive
                  ? (controller.isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05))
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: isActive
                  ? Border.all(
                      color: controller.isDarkMode
                          ? Colors.white.withOpacity(0.2)
                          : Colors.black.withOpacity(0.1),
                    )
                  : null,
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: controller.isDarkMode ? Colors.white : Colors.black87,
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
