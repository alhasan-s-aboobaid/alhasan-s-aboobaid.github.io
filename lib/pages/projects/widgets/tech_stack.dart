import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TechStack extends StatelessWidget {
  final List<dynamic> techStack;
  final bool isMobile;

  const TechStack({
    Key? key,
    required this.techStack,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technologies",
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        isMobile ? 8.vertical : 12.vertical,
        Wrap(
          spacing: isMobile ? 6 : 8,
          runSpacing: isMobile ? 6 : 8,
          children: techStack.map((tech) => _buildTechChip(context, tech)).toList(),
        ),
      ],
    );
  }

  Widget _buildTechChip(BuildContext context, String tech) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 12,
        vertical: isMobile ? 4 : 6
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).themeColors.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        border: Border.all(
          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        tech,
        style: TextStyle(
          color: Theme.of(context).themeColors.primaryLight,
          fontSize: isMobile ? 10 : 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
