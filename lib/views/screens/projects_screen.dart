import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_pro/controllers/theme_controller.dart';
import 'package:portfolio_pro/views/widgets/common/common_appbar.dart';

class ProjectsScreen extends GetView<ThemeController> {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CommonAppBar(currentScreen: 'Projects'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 60),
                  _buildFeaturedProjects(context, isMobile),
                  const SizedBox(height: 80),
                  _buildOtherProjects(context, isMobile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Projects',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'A showcase of my best work in mobile and web development',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildFeaturedProjects(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Projects',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: [
            _buildFeaturedProjectCard(
              context,
              title: 'E-Commerce App',
              description:
                  'A full-featured e-commerce application built with Flutter and Firebase',
              imageUrl: 'assets/images/ed.JPG',
              videoUrl: 'assets/videos/demo.mp4',
              technologies: ['Flutter', 'Firebase', 'GetX'],
              isMobile: isMobile,
            ),
            _buildFeaturedProjectCard(
              context,
              title: 'Social Media Dashboard',
              description:
                  'Real-time social media analytics dashboard built with React',
              imageUrl: 'assets/images/ed.JPG',
              videoUrl: 'assets/videos/demo.mp4',
              technologies: ['React', 'Node.js', 'MongoDB'],
              isMobile: isMobile,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedProjectCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imageUrl,
    required String videoUrl,
    required List<String> technologies,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 500,
      decoration: BoxDecoration(
        color: controller.isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: _buildMediaPreview(imageUrl, videoUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: technologies
                      .map((tech) => _buildTechChip(context, tech))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _buildProjectButton(
                      context,
                      'View Demo',
                      Icons.play_arrow,
                      onTap: () {
                        // Implement demo view logic
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildProjectButton(
                      context,
                      'Source Code',
                      Icons.code,
                      onTap: () {
                        // Implement source code view logic
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaPreview(String imageUrl, String videoUrl) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Center(
            child: IconButton(
              onPressed: () {
                // Implement video player logic
              },
              icon: Icon(
                Icons.play_circle_fill,
                size: 64,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: controller.isDarkMode
            ? Colors.white.withOpacity(0.1)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: controller.isDarkMode ? Colors.white70 : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildProjectButton(
    BuildContext context,
    String label,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: controller.isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: controller.isDarkMode ? Colors.white70 : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: controller.isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherProjects(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Projects',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 30),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: isMobile ? 1.5 : 1,
          ),
          itemCount: 6, // Number of other projects
          itemBuilder: (context, index) {
            return _buildOtherProjectCard(
              context,
              title: 'Project ${index + 1}',
              description: 'Brief description of the project',
              technologies: ['Flutter', 'Firebase'],
            );
          },
        ),
      ],
    );
  }

  Widget _buildOtherProjectCard(
    BuildContext context, {
    required String title,
    required String description,
    required List<String> technologies,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: controller.isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies
                .map((tech) => _buildTechChip(context, tech))
                .toList(),
          ),
        ],
      ),
    );
  }
}
