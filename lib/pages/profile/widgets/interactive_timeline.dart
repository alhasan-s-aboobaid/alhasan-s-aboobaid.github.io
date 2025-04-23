import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class TimelineEvent {
  final String title;
  final String organization;
  final String period;
  final String description;
  final List<String> achievements;
  final String logoPath;
  final Color color;

  TimelineEvent({
    required this.title,
    required this.organization,
    required this.period,
    required this.description,
    required this.achievements,
    required this.logoPath,
    required this.color,
  });
}

class InteractiveTimeline extends StatelessWidget {
  final List<TimelineEvent> events;
  final ScreenType screenType;

  const InteractiveTimeline({
    Key? key,
    required this.events,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenType == ScreenType.mobile ? 20 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EntranceFader(
                duration: const Duration(milliseconds: 400),
                child: Text(
                  "My Journey",
                  style: Theme.of(context).styles.headingLarge.copyWith(
                    fontSize: screenType == ScreenType.mobile ? 28 : 36,
                    color: Theme.of(context).themeColors.primaryColor,
                  ),
                ),
              ),
              16.vertical,
              EntranceFader(
                duration: const Duration(milliseconds: 600),
                child: Text(
                  "Professional experience and education",
                  style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                    fontSize: screenType == ScreenType.mobile ? 14 : 16,
                    color: Theme.of(context).themeColors.disabledButton,
                  ),
                ),
              ),
            ],
          ),
        ),
        40.vertical,
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EntranceFader(
              duration: Duration(milliseconds: 800 + (index * 200)),
              offset: Offset(0, 30),
              child: TimelineItem(
                event: events[index],
                isFirst: index == 0,
                isLast: index == events.length - 1,
                screenType: screenType,
              ),
            );
          },
        ),
      ],
    );
  }
}

class TimelineItem extends StatefulWidget {
  final TimelineEvent event;
  final bool isFirst;
  final bool isLast;
  final ScreenType screenType;

  const TimelineItem({
    Key? key,
    required this.event,
    this.isFirst = false,
    this.isLast = false,
    required this.screenType,
  }) : super(key: key);

  @override
  _TimelineItemState createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.screenType == ScreenType.mobile;
    final double timelineDotSize = isMobile ? 20 : 24;
    final double timelineWidth = isMobile ? 2 : 3;
    
    return InkWell(
      onTap: _toggleExpanded,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          left: isMobile ? 20 : 40,
          right: isMobile ? 20 : 40,
          bottom: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline line and dot
            Column(
              children: [
                // Top line
                if (!widget.isFirst)
                  Container(
                    width: timelineWidth,
                    height: 30,
                    color: widget.event.color.withOpacity(0.5),
                  ),
                
                // Timeline dot
                Container(
                  width: timelineDotSize,
                  height: timelineDotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.event.color,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: widget.event.color.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: _isExpanded
                      ? Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: isMobile ? 12 : 16,
                        )
                      : Icon(
                          Icons.add,
                          color: Colors.white,
                          size: isMobile ? 12 : 16,
                        ),
                ),
                
                // Bottom line
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: timelineWidth,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
            
            16.horizontal,
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      // Title and period
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.event.title,
                              style: Theme.of(context).styles.headingMedium.copyWith(
                                fontSize: isMobile ? 18 : 22,
                                color: Colors.white,
                              ),
                            ),
                            8.vertical,
                            Text(
                              widget.event.organization,
                              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: widget.event.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.vertical,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: widget.event.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                widget.event.period,
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 14,
                                  color: widget.event.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Logo
                      if (widget.event.logoPath.isNotEmpty)
                        Container(
                          width: isMobile ? 40 : 50,
                          height: isMobile ? 40 : 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            widget.event.logoPath,
                            color: widget.event.color,
                          ),
                        ),
                    ],
                  ),
                  
                  // Expandable content
                  ClipRect(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.topCenter,
                          heightFactor: _heightFactor.value,
                          child: child,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.vertical,
                          // Description
                          Text(
                            widget.event.description,
                            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                              fontSize: isMobile ? 14 : 16,
                              color: Theme.of(context).themeColors.disabledButton,
                              height: 1.5,
                            ),
                          ),
                          
                          if (widget.event.achievements.isNotEmpty) ...[
                            16.vertical,
                            // Achievements
                            Text(
                              "Key Achievements:",
                              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            12.vertical,
                            ...widget.event.achievements.map((achievement) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: widget.event.color,
                                      size: 16,
                                    ),
                                    8.horizontal,
                                    Expanded(
                                      child: Text(
                                        achievement,
                                        style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                                          fontSize: isMobile ? 13 : 15,
                                          color: Theme.of(context).themeColors.disabledButton,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
