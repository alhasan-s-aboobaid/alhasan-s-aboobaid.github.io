import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class Achievement {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class Metric {
  final int value;
  final String label;
  final IconData icon;
  final Color color;

  Metric({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });
}

class AchievementsSection extends StatelessWidget {
  final ScreenType screenType;

  const AchievementsSection({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenType == ScreenType.mobile;

    // Define metrics
    final List<Metric> metrics = [
      Metric(
        value: 50,
        label: "Projects Completed",
        icon: Icons.check_circle,
        color: Colors.green,
      ),
      Metric(
        value: 5,
        label: "Years Experience",
        icon: Icons.access_time,
        color: Colors.blue,
      ),
      Metric(
        value: 30,
        label: "Happy Clients",
        icon: Icons.people,
        color: Colors.orange,
      ),
    ];

    // Define achievements
    final List<Achievement> achievements = [
      Achievement(
        title: "Google Developer Expert",
        description: "Recognized for expertise in Flutter and mobile development",
        icon: Icons.verified,
        color: Colors.blue,
      ),
      Achievement(
        title: "Top Rated Developer",
        description: "Consistently rated among top mobile developers",
        icon: Icons.star,
        color: Colors.amber,
      ),
      Achievement(
        title: "Open Source Contributor",
        description: "Active contributor to Flutter ecosystem and open source projects",
        icon: Icons.code,
        color: Colors.purple,
      ),
    ];

    // Define client logos
    final List<String> clientLogos = [
      IconManager.maidsccLogo,
      IconManager.electromall,
      IconManager.kelshimall,
      IconManager.flutter,
      IconManager.firebase,
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
              "Achievements & Impact",
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
              "Milestones and metrics from my professional journey",
              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: Theme.of(context).themeColors.disabledButton,
              ),
            ),
          ),
          40.vertical,

          // Animated counters
          EntranceFader(
            duration: const Duration(milliseconds: 800),
            offset: Offset(0, 30),
            child: isMobile
                ? Column(
                    children: metrics.map((metric) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: AnimatedCounter(
                          metric: metric,
                          screenType: screenType,
                        ),
                      );
                    }).toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: metrics.map((metric) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: AnimatedCounter(
                            metric: metric,
                            screenType: screenType,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),

          60.vertical,

          // Achievements
          EntranceFader(
            duration: const Duration(milliseconds: 1000),
            offset: Offset(0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Key Achievements",
                  style: Theme.of(context).styles.headingMedium.copyWith(
                    fontSize: isMobile ? 20 : 24,
                    color: Colors.white,
                  ),
                ),
                24.vertical,
                isMobile
                    ? Column(
                        children: achievements.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final Achievement achievement = entry.value;

                          return EntranceFader(
                            duration: Duration(milliseconds: 1200 + (index * 200)),
                            offset: Offset(0, 30),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: AchievementCard(
                                achievement: achievement,
                                screenType: screenType,
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Row(
                        children: achievements.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final Achievement achievement = entry.value;

                          return Expanded(
                            child: EntranceFader(
                              duration: Duration(milliseconds: 1200 + (index * 200)),
                              offset: Offset(0, 30),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: AchievementCard(
                                  achievement: achievement,
                                  screenType: screenType,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),

          60.vertical,

          // Client logos
          EntranceFader(
            duration: const Duration(milliseconds: 1400),
            offset: Offset(0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Clients & Partners",
                  style: Theme.of(context).styles.headingMedium.copyWith(
                    fontSize: isMobile ? 20 : 24,
                    color: Colors.white,
                  ),
                ),
                16.vertical,
                Text(
                  "Organizations I've had the pleasure to work with",
                  style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                    fontSize: isMobile ? 14 : 16,
                    color: Theme.of(context).themeColors.disabledButton,
                  ),
                ),
                32.vertical,
                ClientLogosCarousel(
                  logos: clientLogos,
                  screenType: screenType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCounter extends StatefulWidget {
  final Metric metric;
  final ScreenType screenType;

  const AnimatedCounter({
    Key? key,
    required this.metric,
    required this.screenType,
  }) : super(key: key);

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.metric.value.toDouble(),
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

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.metric.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            widget.metric.icon,
            color: widget.metric.color,
            size: isMobile ? 32 : 40,
          ),
          16.vertical,
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+",
                    style: Theme.of(context).styles.headingLarge.copyWith(
                      fontSize: isMobile ? 24 : 32,
                      color: widget.metric.color,
                    ),
                  ),
                  Text(
                    "${_animation.value.toInt()}",
                    style: Theme.of(context).styles.headingLarge.copyWith(
                      fontSize: isMobile ? 32 : 48,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
          8.vertical,
          Text(
            widget.metric.label,
            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: Theme.of(context).themeColors.disabledButton,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final ScreenType screenType;

  const AchievementCard({
    Key? key,
    required this.achievement,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenType == ScreenType.mobile;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: achievement.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: achievement.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  achievement.icon,
                  color: achievement.color,
                  size: isMobile ? 20 : 24,
                ),
              ),
              12.horizontal,
              Expanded(
                child: Text(
                  achievement.title,
                  style: Theme.of(context).styles.headingMedium.copyWith(
                    fontSize: isMobile ? 16 : 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          16.vertical,
          Text(
            achievement.description,
            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: Theme.of(context).themeColors.disabledButton,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class ClientLogosCarousel extends StatefulWidget {
  final List<String> logos;
  final ScreenType screenType;

  const ClientLogosCarousel({
    Key? key,
    required this.logos,
    required this.screenType,
  }) : super(key: key);

  @override
  _ClientLogosCarouselState createState() => _ClientLogosCarouselState();
}

class _ClientLogosCarouselState extends State<ClientLogosCarousel> {
  // Simplified implementation without auto-scroll
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.screenType == ScreenType.mobile;
    final double logoSize = isMobile ? 60 : 80;

    return Container(
      height: logoSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.logos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: logoSize,
            height: logoSize,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              widget.logos[index],
              color: Colors.white.withOpacity(0.7),
            ),
          );
        },
      ),
    );
  }
}
