import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/project_details.dart';
import 'package:alhasan_abo_obaid/pages/projects/widgets/project_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FlipProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final int index;
  final ScreenType screenType;
  final Sizes sizes;

  const FlipProjectCard({
    Key? key,
    required this.project,
    required this.index,
    required this.screenType,
    required this.sizes,
  }) : super(key: key);

  @override
  State<FlipProjectCard> createState() => _FlipProjectCardState();
}

class _FlipProjectCardState extends State<FlipProjectCard> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHovered = false;

  // Track if card is flipped
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: Duration(milliseconds: 300 * widget.index),
      offset: Offset(0, 30),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: FlipCard(
            key: cardKey,
            flipOnTouch: true, // Enable flip on touch for all devices
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            onFlipDone: (isFront) {
              // Update the flipped state
              setState(() => isFlipped = !isFront);
            },
            front: _buildFrontCard(),
            back: _buildBackCard(),
          ),
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Project image as background
            Positioned.fill(
              child: Image.asset(
                "assets/projects/${widget.project['image']}",
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Company logo
                  widget.project['companyLogo'].toString().toAsset(
                        w: 50,
                        h: 50,
                      ),
                  16.vertical,
                  // Project title
                  Text(
                    widget.project['name'],
                    style: Theme.of(context).styles.headingLarge.copyWith(
                          color: Colors.white,
                          fontSize: widget.screenType == ScreenType.mobile
                              ? widget.sizes.titleFontSize * 0.8
                              : widget.sizes.titleFontSize,
                        ),
                  ),
                  8.vertical,
                  // Project role and year
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.project['role'],
                          style: TextStyle(
                            color: Theme.of(context).themeColors.primaryLight,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      16.horizontal,
                      Text(
                        widget.project['year'],
                        style: TextStyle(
                          color: Theme.of(context).themeColors.disabledButton,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  16.vertical,
                  // Flip instruction for all devices
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app,
                        color: Theme.of(context).themeColors.primaryColor,
                        size: 16,
                      ),
                      8.horizontal,
                      Text(
                        "Tap to flip",
                        style: TextStyle(
                          color: Theme.of(context).themeColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project title
            Text(
              widget.project['name'],
              style: Theme.of(context).styles.headingMedium.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
            ),
            16.vertical,
            // Project description
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project['description'],
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                            color: Theme.of(context).themeColors.disabledButton,
                            fontSize: 14,
                            height: 1.6,
                          ),
                    ),
                    24.vertical,
                    // Project images
                    Text(
                      "Project Screenshots",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    16.vertical,
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/projects/${widget.project['image']}",
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        12.horizontal,
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/projects/${widget.project['image']}",
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        12.horizontal,
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/projects/${widget.project['image']}",
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            16.vertical,
            // Tech stack
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technologies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.vertical,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (widget.project['techStack'] as List).map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).themeColors.primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          color: Theme.of(context).themeColors.primaryLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            16.vertical,
            // View project button
            GestureDetector(
              onTap: () {
                launchUrlString(widget.project['link']);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).themeColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "View Project",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Flip instruction for all devices
            16.vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.touch_app,
                  color: Theme.of(context).themeColors.primaryColor,
                  size: 16,
                ),
                8.horizontal,
                Text(
                  "Tap to flip back",
                  style: TextStyle(
                    color: Theme.of(context).themeColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

