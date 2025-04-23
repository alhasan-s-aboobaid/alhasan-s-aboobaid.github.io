import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/skill_card.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/skill_category.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/skill_chip.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/skill_header.dart';
import 'package:alhasan_abo_obaid/pages/skills/widgets/skill_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsPage extends StatefulWidget {
  final Sizes sizes;

  const SkillsPage({super.key, required this.sizes});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with SingleTickerProviderStateMixin {
  // Technical skills with proficiency levels
  final List<Map<String, dynamic>> technicalSkills = [
    {'name': 'Flutter', 'level': 0.95, 'color': Colors.blue},
    {'name': 'Dart', 'level': 0.92, 'color': Colors.teal},
    {'name': 'Firebase', 'level': 0.85, 'color': Colors.orange},
    {'name': 'REST APIs', 'level': 0.90, 'color': Colors.green},
    {'name': 'State Management', 'level': 0.88, 'color': Colors.deepPurple},
  ];

  // Framework and libraries
  final List<Map<String, dynamic>> frameworkSkills = [
    {'name': 'Provider', 'color': Colors.blue, 'icon': Icons.extension},
    {'name': 'Bloc', 'color': Colors.deepPurple, 'icon': Icons.extension},
    {'name': 'GetX', 'color': Colors.teal, 'icon': Icons.extension},
    {'name': 'Riverpod', 'color': Colors.indigo, 'icon': Icons.extension},
    {'name': 'MobX', 'color': Colors.orange, 'icon': Icons.extension},
    {'name': 'GraphQL', 'color': Colors.pink, 'icon': Icons.api},
    {'name': 'WebSockets', 'color': Colors.green, 'icon': Icons.sync},
    {'name': 'SQLite', 'color': Colors.blueGrey, 'icon': Icons.storage},
    {'name': 'Hive', 'color': Colors.amber, 'icon': Icons.storage},
  ];

  // Development tools and platforms
  final List<Map<String, dynamic>> devTools = [
    {'name': 'Git', 'color': Colors.red, 'icon': Icons.code},
    {'name': 'CI/CD', 'color': Colors.green, 'icon': Icons.sync},
    {'name': 'Firebase', 'color': Colors.orange, 'icon': Icons.cloud},
    {'name': 'AWS', 'color': Colors.amber, 'icon': Icons.cloud},
    {'name': 'Google Cloud', 'color': Colors.blue, 'icon': Icons.cloud},
    {'name': 'Jira', 'color': Colors.indigo, 'icon': Icons.task},
    {'name': 'Figma', 'color': Colors.purple, 'icon': Icons.design_services},
  ];

  // Soft skills
  final List<Map<String, dynamic>> softSkills = [
    {
      'title': 'Problem Solving',
      'description': 'Analytical thinking and creative approach to solving complex technical challenges.',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Team Collaboration',
      'description': 'Effective communication and collaboration with cross-functional teams.',
      'icon': Icons.people,
      'color': Colors.blue,
    },
    {
      'title': 'Adaptability',
      'description': 'Quick to learn new technologies and adapt to changing requirements.',
      'icon': Icons.sync,
      'color': Colors.green,
    },
    {
      'title': 'Time Management',
      'description': 'Efficient prioritization and organization of tasks to meet deadlines.',
      'icon': Icons.timer,
      'color': Colors.purple,
    },
  ];

  // Specialized skills
  final List<Map<String, dynamic>> specializedSkills = [
    {'name': 'UI/UX Implementation', 'color': Colors.pink},
    {'name': 'Animations', 'color': Colors.purple},
    {'name': 'Responsive Design', 'color': Colors.indigo},
    {'name': 'Performance Optimization', 'color': Colors.teal},
    {'name': 'App Architecture', 'color': Colors.deepOrange},
    {'name': 'Testing & Debugging', 'color': Colors.green},
    {'name': 'Localization', 'color': Colors.blue},
    {'name': 'Accessibility', 'color': Colors.amber},
    {'name': 'Push Notifications', 'color': Colors.red},
    {'name': 'In-App Purchases', 'color': Colors.lightGreen},
  ];

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isDesktop = screenType == ScreenType.desktop;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenType == ScreenType.mobile ? widget.sizes.sectionPadding * 0.8 : widget.sizes.sectionPadding,
        vertical: screenType == ScreenType.mobile ? 24 : 32,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            SkillHeader(sizes: widget.sizes),
            (screenType == ScreenType.mobile ? 32 : 48).verticalSpace,

            // Main content based on screen size
            isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Technical Skills Section
        SkillCategory(
          title: "Technical Proficiency",
          description: "Core technologies and languages",
          icon: Icons.code,
          delayFactor: 1,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...technicalSkills.asMap().entries.map((entry) {
                        return SkillProgressBar(
                          name: entry.value['name'],
                          level: entry.value['level'],
                          color: entry.value['color'],
                          index: entry.key,
                        );
                      }).toList(),
                    ],
                  ),
                ),
                32.horizontalSpace,
                Expanded(
                  flex: 2,
                  child: EntranceFader(
                    delay: const Duration(milliseconds: 800),
                    offset: const Offset(30, 0),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Frameworks & Libraries",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          16.verticalSpace,
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: frameworkSkills.map((skill) {
                              return SkillChip(
                                name: skill['name'],
                                color: skill['color'],
                                icon: skill['icon'],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        // Development Tools Section
        SkillCategory(
          title: "Development Tools & Platforms",
          description: "Tools and platforms I work with",
          icon: Icons.build,
          delayFactor: 2,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: devTools.map((tool) {
                return SkillChip(
                  name: tool['name'],
                  color: tool['color'],
                  icon: tool['icon'],
                  isDark: true,
                );
              }).toList(),
            ),
          ],
        ),

        // Soft Skills Section
        SkillCategory(
          title: "Professional Skills",
          description: "Soft skills and professional capabilities",
          icon: Icons.psychology,
          delayFactor: 3,
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2.5,
              children: softSkills.asMap().entries.map((entry) {
                return SkillCard(
                  title: entry.value['title'],
                  description: entry.value['description'],
                  icon: entry.value['icon'],
                  color: entry.value['color'],
                  index: entry.key,
                );
              }).toList(),
            ),
          ],
        ),

        // Specialized Skills Section
        SkillCategory(
          title: "Specialized Expertise",
          description: "Areas of specialized knowledge and expertise",
          icon: Icons.star,
          delayFactor: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Theme.of(context).themeColors.primaryColor.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: specializedSkills.map((skill) {
                  return SkillChip(
                    name: skill['name'],
                    color: skill['color'],
                    isDark: false,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Technical Skills Section
        SkillCategory(
          title: "Technical Proficiency",
          description: "Core technologies and languages",
          icon: Icons.code,
          delayFactor: 1,
          children: [
            ...technicalSkills.asMap().entries.map((entry) {
              return SkillProgressBar(
                name: entry.value['name'],
                level: entry.value['level'],
                color: entry.value['color'],
                index: entry.key,
              );
            }).toList(),
            20.verticalSpace,
            EntranceFader(
              delay: const Duration(milliseconds: 800),
              offset: const Offset(0, 30),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Frameworks & Libraries",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.verticalSpace,
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: frameworkSkills.map((skill) {
                        return SkillChip(
                          name: skill['name'],
                          color: skill['color'],
                          icon: skill['icon'],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Development Tools Section
        SkillCategory(
          title: "Development Tools & Platforms",
          description: "Tools and platforms I work with",
          icon: Icons.build,
          delayFactor: 2,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: devTools.map((tool) {
                return SkillChip(
                  name: tool['name'],
                  color: tool['color'],
                  icon: tool['icon'],
                  isDark: true,
                );
              }).toList(),
            ),
          ],
        ),

        // Soft Skills Section
        SkillCategory(
          title: "Professional Skills",
          description: "Soft skills and professional capabilities",
          icon: Icons.psychology,
          delayFactor: 3,
          children: [
            ...softSkills.asMap().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SkillCard(
                  title: entry.value['title'],
                  description: entry.value['description'],
                  icon: entry.value['icon'],
                  color: entry.value['color'],
                  index: entry.key,
                ),
              );
            }).toList(),
          ],
        ),

        // Specialized Skills Section
        SkillCategory(
          title: "Specialized Expertise",
          description: "Areas of specialized knowledge and expertise",
          icon: Icons.star,
          delayFactor: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: specializedSkills.map((skill) {
                  return SkillChip(
                    name: skill['name'],
                    color: skill['color'],
                    isDark: false,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
