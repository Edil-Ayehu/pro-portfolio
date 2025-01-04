import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_pro/controllers/theme_controller.dart';
import 'package:portfolio_pro/views/widgets/common/common_appbar.dart';

class AboutScreen extends GetView<ThemeController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CommonAppBar(currentScreen: 'About'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine if we're on a mobile device
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
                  _buildHeader(context, isMobile),
                  const SizedBox(height: 60),
                  _buildExperienceSection(context, isMobile),
                  const SizedBox(height: 60),
                  _buildEducationSection(context, isMobile),
                  const SizedBox(height: 60),
                  _buildSkillsSection(context, isMobile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 30),
        if (!isMobile)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildBio(context)),
              const SizedBox(width: 60),
              Expanded(child: _buildPersonalInfo(context)),
            ],
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBio(context),
              const SizedBox(height: 40),
              _buildPersonalInfo(context),
            ],
          ),
      ],
    );
  }

  Widget _buildBio(BuildContext context) {
    return Text(
      'I am a passionate software developer with expertise in Flutter and React development. '
      'With a strong foundation in both mobile and web technologies, I specialize in creating '
      'intuitive and efficient applications that deliver exceptional user experiences.\n\n'
      'My journey in software development began with a curiosity for creating solutions '
      'that make a difference in people\'s lives. Today, I continue to pursue that passion '
      'by building applications that are not only functional but also aesthetically pleasing '
      'and user-friendly.',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildPersonalInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: controller.isDarkMode ? Colors.grey[850] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem(context, 'Location', 'Addis Ababa, Ethiopia'),
          const SizedBox(height: 16),
          _buildInfoItem(context, 'Email', 'edilayehu.tadesse@gmail.com'),
          const SizedBox(height: 16),
          _buildInfoItem(context, 'Experience', '3+ Years'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildExperienceSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildExperienceCard(
              context,
              'Senior Flutter Developer',
              'Company Name',
              '2021 - Present',
              isMobile,
            ),
            _buildExperienceCard(
              context,
              'React Developer',
              'Previous Company',
              '2019 - 2021',
              isMobile,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExperienceCard(BuildContext context, String title, String company,
      String period, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: controller.isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            company,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            period,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }

  // Add education and skills sections similarly...
  // You can follow the same pattern as the experience section
  Widget _buildEducationSection(BuildContext context, bool isMobile) {
    // Implementation similar to experience section
    return Container(); // Placeholder
  }

  Widget _buildSkillsSection(BuildContext context, bool isMobile) {
    // Implementation similar to experience section
    return Container(); // Placeholder
  }
}
