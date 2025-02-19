import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RightSkills extends StatefulWidget {
  const RightSkills({super.key, this.isVertical = false});

  final bool isVertical;

  @override
  State<RightSkills> createState() => _RightSkillsState();
}

class _RightSkillsState extends State<RightSkills> {

  final List<Map<String, dynamic>> otherSkills2 = [
    {'name': 'Hard worker', 'color': Colors.blue},
    {'name': 'Problem-Solving & Critical Thinking','color': Colors.deepOrangeAccent},
    {'name': 'Agile','color': Colors.yellow},
    {'name': 'Jira','color': Colors.lightGreen},
    {'name': 'Resilience & Debugging Patience','color': Colors.lightGreen},
    {'name': 'Adaptability & Continuous Learning','color': Colors.deepPurple},
    {'name': 'Communication & Collaboration','color': Colors.pink},
    {'name': 'Time Management & Organization','color': Colors.pink},
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("NonTech Skills", style: Theme.of(context).styles.headingSmall.copyWith(
            color: Colors.white
        ),),
        12.verticalSpace,
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                runSpacing: widget.isVertical ? 10 : 20,
                spacing: widget.isVertical ? 10 : 20,
                children: [
                  ...otherSkills2.map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).themeColors.textBody,
                          borderRadius: 8.radiusAll,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white, blurRadius: 4, blurStyle: BlurStyle.outer, spreadRadius: 2
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8, height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            skill['name'],
                            style: TextStyle(
                              fontSize: widget.isVertical ? 12.sp : 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}