import 'dart:math';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class Skill {
  final String name;
  final double level;
  final int years;
  final String iconPath;
  final Color color;

  Skill({
    required this.name,
    required this.level,
    required this.years,
    required this.iconPath,
    required this.color,
  });
}

class SkillCluster {
  final String title;
  final String description;
  final List<Skill> skills;
  final Color color;
  final IconData icon;

  SkillCluster({
    required this.title,
    required this.description,
    required this.skills,
    required this.color,
    required this.icon,
  });
}

class SkillsShowcase extends StatelessWidget {
  final ScreenType screenType;

  const SkillsShowcase({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenType == ScreenType.mobile;

    // Define skill clusters
    final List<SkillCluster> skillClusters = [
      SkillCluster(
        title: "Mobile Development",
        description: "Building cross-platform mobile applications",
        color: Colors.blue,
        icon: Icons.smartphone,
        skills: [
          Skill(
            name: "Flutter",
            level: 0.95,
            years: 4,
            iconPath: IconManager.flutter,
            color: Colors.blue,
          ),
          Skill(
            name: "Dart",
            level: 0.92,
            years: 4,
            iconPath: IconManager.dart,
            color: Colors.blue.shade700,
          ),
          Skill(
            name: "UI/UX Design",
            level: 0.85,
            years: 3,
            iconPath: IconManager.figma,
            color: Colors.purple,
          ),
          Skill(
            name: "Native Android",
            level: 0.75,
            years: 2,
            iconPath: IconManager.android,
            color: Colors.green,
          ),
        ],
      ),
      SkillCluster(
        title: "Backend & Cloud",
        description: "Server-side development and cloud services",
        color: Colors.orange,
        icon: Icons.cloud,
        skills: [
          Skill(
            name: "Firebase",
            level: 0.90,
            years: 4,
            iconPath: IconManager.firebase,
            color: Colors.orange,
          ),
          Skill(
            name: "REST APIs",
            level: 0.85,
            years: 5,
            iconPath: IconManager.api,
            color: Colors.teal,
          ),
          Skill(
            name: "Spring Boot",
            level: 0.70,
            years: 2,
            iconPath: IconManager.springBoot,
            color: Colors.green,
          ),
        ],
      ),
      SkillCluster(
        title: "Tools & Practices",
        description: "Development tools and methodologies",
        color: Colors.purple,
        icon: Icons.build,
        skills: [
          Skill(
            name: "Git",
            level: 0.88,
            years: 6,
            iconPath: IconManager.git,
            color: Colors.red,
          ),
          Skill(
            name: "CI/CD",
            level: 0.80,
            years: 3,
            iconPath: IconManager.cicd,
            color: Colors.blue,
          ),
          Skill(
            name: "Agile",
            level: 0.85,
            years: 4,
            iconPath: IconManager.agile,
            color: Colors.teal,
          ),
        ],
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EntranceFader(
            duration: const Duration(milliseconds: 400),
            child: Text(
              "Technical Expertise",
              style: Theme.of(context).styles.headingLarge.copyWith(
                fontSize: isMobile ? 28 : 36,
                color: Theme.of(context).themeColors.primaryColor,
              ),
            ),
          ),
          16.vertical,
          EntranceFader(
            duration: const Duration(milliseconds: 600),
            child: Text(
              "Skills and technologies I've mastered over the years",
              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: Theme.of(context).themeColors.disabledButton,
              ),
            ),
          ),
          40.vertical,

          // Skill clusters
          ...skillClusters.asMap().entries.map((entry) {
            final int index = entry.key;
            final SkillCluster cluster = entry.value;

            return EntranceFader(
              duration: Duration(milliseconds: 800 + (index * 200)),
              offset: Offset(0, 30),
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: SkillClusterWidget(
                  cluster: cluster,
                  screenType: screenType,
                ),
              ),
            );
          }).toList(),

          // Removed radar chart for simplicity
        ],
      ),
    );
  }
}

class SkillClusterWidget extends StatelessWidget {
  final SkillCluster cluster;
  final ScreenType screenType;

  const SkillClusterWidget({
    Key? key,
    required this.cluster,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenType == ScreenType.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cluster header
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cluster.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                cluster.icon,
                color: cluster.color,
                size: isMobile ? 24 : 28,
              ),
            ),
            16.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cluster.title,
                    style: Theme.of(context).styles.headingMedium.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: Colors.white,
                    ),
                  ),
                  4.vertical,
                  Text(
                    cluster.description,
                    style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                      fontSize: isMobile ? 14 : 16,
                      color: Theme.of(context).themeColors.disabledButton,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        24.vertical,

        // Skills
        isMobile
            ? Column(
                children: cluster.skills.map((skill) {
                  return SkillProgressBar(
                    skill: skill,
                    screenType: screenType,
                  );
                }).toList(),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: cluster.skills.length,
                itemBuilder: (context, index) {
                  return SkillProgressBar(
                    skill: cluster.skills[index],
                    screenType: screenType,
                  );
                },
              ),
      ],
    );
  }
}

class SkillProgressBar extends StatefulWidget {
  final Skill skill;
  final ScreenType screenType;

  const SkillProgressBar({
    Key? key,
    required this.skill,
    required this.screenType,
  }) : super(key: key);

  @override
  _SkillProgressBarState createState() => _SkillProgressBarState();
}

class _SkillProgressBarState extends State<SkillProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.skill.level,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.screenType == ScreenType.mobile;

    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 20 : 0),
      child: Row(
        children: [
          // Skill icon
          Container(
            width: isMobile ? 40 : 50,
            height: isMobile ? 40 : 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.skill.color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Image.asset(
              widget.skill.iconPath,
              color: widget.skill.color,
            ),
          ),
          12.horizontal,

          // Skill details and progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skill name and years
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.skill.name,
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: widget.skill.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "${widget.skill.years} ${widget.skill.years == 1 ? 'year' : 'years'}",
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                              color: widget.skill.color,
                            ),
                          ),
                        ),
                        8.horizontal,
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Text(
                              "${(_animation.value * 100).toInt()}%",
                              style: TextStyle(
                                fontSize: isMobile ? 12 : 14,
                                color: widget.skill.color,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                8.vertical,

                // Progress bar
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Stack(
                      children: [
                        // Background
                        Container(
                          height: isMobile ? 6 : 8,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        // Progress
                        Container(
                          height: isMobile ? 6 : 8,
                          width: MediaQuery.of(context).size.width * _animation.value * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                widget.skill.color.withOpacity(0.7),
                                widget.skill.color,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: widget.skill.color.withOpacity(0.5),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Removed SkillRadarChart for simplicity
