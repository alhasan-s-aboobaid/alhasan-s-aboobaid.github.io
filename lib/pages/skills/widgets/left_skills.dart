import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LeftSkills extends StatefulWidget {
  const LeftSkills({super.key, required this.sizes});

  final Sizes sizes;

  @override
  State<LeftSkills> createState() => _LeftSkillsState();
}

class _LeftSkillsState extends State<LeftSkills> {

  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'level': 0.9, 'color': Colors.blue},
    {'name': 'Firebase', 'level': 0.8, 'color': Colors.orange},
    {'name': 'Implement UI/UX Design', 'level': 0.92, 'color': Colors.purple},
    {'name': 'REST APIs', 'level': 0.9, 'color': Colors.green},
    {'name': 'Bloc, Provider', 'level': 0.88, 'color': Colors.deepOrangeAccent},
  ];


  final List<Map<String, dynamic>> otherSkills = [
    {'name': 'API Integration & Networking', 'color': Colors.blue},
    {'name': 'State Management','color': Colors.deepOrangeAccent},
    {'name': 'Database & Local Storage','color': Colors.deepPurple},
    {'name': 'Flutter web','color': Colors.pink},
    {'name': 'Firebase & Backend Integration','color': Colors.brown},
    {'name': 'Deeplink','color': Colors.blue},
    {'name': 'CI/CD','color': Colors.blue},
    {'name': 'UI/UX & Animations','color': Colors.grey},
    {'name': 'Performance Optimization','color': Colors.blueGrey},
    {'name': 'Deployment & DevOps','color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntranceFader(
          child: Text(
            "What My Skills Included",
            style: Theme.of(context).styles.headingMedium.copyWith(
                color: Theme.of(context).themeColors.white, fontSize: widget.sizes.homeGreetingTitle),
          ),
        ),
        24.verticalSpace,
        EntranceFader(
          delay: Duration(milliseconds: 300),
          child: Text(
            "These are the principles we follow in every line of code we write. Every application we develop, every system we design, and every experience we create must not only function flawlessly but also be efficient and elegant.",
            style: Theme.of(context).styles.bodyRegularSmall.copyWith(
                color: Theme.of(context).themeColors.disabledButton, fontSize: widget.sizes.homeSubtitle),
          ),
        ),
        16.verticalSpace,
        EntranceFader(
            delay: Duration(milliseconds: 600),
            child: Column(children: [
              ...skills.map((skill) {
                return TweenAnimationBuilder(
                  duration: const Duration(seconds: 3),
                  tween: Tween<double>(begin: 0, end: skill['level']),
                  builder: (context, double value, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                skill['name'],
                                style: Theme.of(context).styles.bodyRegularLarge.copyWith(
                                    color: Colors.white
                                )
                            ),
                            Text(
                              '${(value * 100).toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.grey[300],
                          color: skill['color'],
                          minHeight: 5,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        20.verticalSpace
                      ],
                    );
                  },
                );
              }),
            ],)),
        8.verticalSpace,
        EntranceFader(
          delay: const Duration(milliseconds: 1000),
          child: Container(
            padding: 6.all,
            child: Wrap(
              runSpacing: 12,
              spacing: 12,
              children: [
                ...otherSkills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: 8.radiusAll,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white, blurRadius: 4, blurStyle: BlurStyle.outer, spreadRadius: 2
                          )
                        ]
                    ),
                    child: Text(
                      skill['name'],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

