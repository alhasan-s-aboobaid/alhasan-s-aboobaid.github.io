import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticlesPage extends StatefulWidget {
  final Sizes sizes;
  final ScreenType screenType;

  const ArticlesPage({super.key, required this.sizes, required this.screenType});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> articles = [
      {
        'title': 'Creating a Progressive Text Animation in Flutter',
        'description': 'Animations can greatly enhance user experience, making your app feel smooth and dynamic. In this article, we’ll create a progressive text animation using Flutter’s TweenAnimationBuilder. This animation gradually fills the text characters based on a transition effect.',
        'url': 'https://medium.com/@alhasan.aboobaid/creating-a-progressive-text-animation-in-flutter-1de24a091d08?source=user_profile_page---------0-------------79dad89b388----------------------',
        'platform': 'Medium',
        'platformIcon': FontAwesomeIcons.medium,
        'date': 'May 2023',
        'image': 'article1.png',
      },
      {
        'title': 'Understanding Dart Garbage Collector',
        'description': 'Flutter, renowned for its "write once, run anywhere" proposition, stands out as the preferred framework for numerous developers. As is the case with any platform, proficient memory management within Flutter holds paramount importance for achieving swift performance, responsiveness, and an uninterrupted user experience.',
        'url': 'https://www.linkedin.com/posts/alhasan-abo-obaid-602501124_dart-garbageabrcollector-activity-7159986066525978624-ieei?utm_source=share&utm_medium=member_desktop&rcm=ACoAAB6vxiIBhDy_Iap6KIIed0M1EdDi9oihYkQ',
        'platform': 'LinkedIn',
        'platformIcon': FontAwesomeIcons.linkedin,
        'date': 'April 2023',
        'image': 'article2.png',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.screenType == ScreenType.mobile ? widget.sizes.sectionPadding * 0.8 : widget.sizes.sectionPadding,
        vertical: widget.screenType == ScreenType.mobile ? 24 : 32
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EntranceFader(
              duration: const Duration(milliseconds: 400),
              child: Text(
                "Latest Articles",
                style: Theme.of(context).styles.headingLarge.copyWith(
                  fontSize: widget.screenType == ScreenType.mobile ? widget.sizes.titleFontSize * 1.2 : widget.sizes.titleFontSize * 1.5,
                  color: Theme.of(context).themeColors.primaryColor,
                ),
              ),
            ),
            (widget.screenType == ScreenType.mobile ? 12 : 16).verticalSpace,
            EntranceFader(
              duration: const Duration(milliseconds: 600),
              child: Text(
                "Sharing knowledge and insights about Flutter, Dart, and mobile development",
                style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                  fontSize: widget.screenType == ScreenType.mobile ? widget.sizes.subtitleFontSize * 0.9 : widget.sizes.subtitleFontSize,
                  color: Theme.of(context).themeColors.disabledButton,
                ),
              ),
            ),
            (widget.screenType == ScreenType.mobile ? 24 : 32).verticalSpace,
            _buildArticlesList(articles),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesList(List<Map<String, dynamic>> articles) {
    return widget.screenType == ScreenType.desktop
        ? _buildDesktopArticlesList(articles)
        : _buildMobileArticlesList(articles);
  }

  Widget _buildDesktopArticlesList(List<Map<String, dynamic>> articles) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.8,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _buildArticleCard(articles[index]);
      },
    );
  }

  Widget _buildMobileArticlesList(List<Map<String, dynamic>> articles) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 24.0),
          child: _buildArticleCard(articles[index]),
        );
      },
    );
  }

  Widget _buildArticleCard(Map<String, dynamic> article) {
    return EntranceFader(
      duration: const Duration(milliseconds: 800),
      child: _ArticleCard(
        title: article['title'],
        description: article['description'],
        url: article['url'],
        platform: article['platform'],
        platformIcon: article['platformIcon'],
        date: article['date'],
        image: article['image'],
        isMobile: widget.screenType == ScreenType.mobile,
      ),
    );
  }
}

class _ArticleCard extends StatefulWidget {
  final String title;
  final String description;
  final String url;
  final String platform;
  final IconData platformIcon;
  final String date;
  final String image;
  final bool isMobile;

  const _ArticleCard({
    required this.title,
    required this.description,
    required this.url,
    required this.platform,
    required this.platformIcon,
    required this.date,
    required this.image,
    this.isMobile = false,
  });

  @override
  State<_ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<_ArticleCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrlString(widget.url);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: (widget.isMobile ? 12 : 16).all,
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.05),
            borderRadius: (widget.isMobile ? 10 : 12).radiusAll,
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    widget.platformIcon,
                    color: Theme.of(context).themeColors.primaryColor,
                    size: widget.isMobile ? 16 : 20,
                  ),
                  (widget.isMobile ? 6 : 8).horizontalSpace,
                  Text(
                    widget.platform,
                    style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                      color: Theme.of(context).themeColors.primaryLight,
                      fontSize: widget.isMobile ? 12 : 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.date,
                    style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                      color: Theme.of(context).themeColors.disabledButton,
                      fontSize: widget.isMobile ? 10 : 12,
                    ),
                  ),
                ],
              ),
              (widget.isMobile ? 8 : 12).verticalSpace,
              widget.isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on top for mobile
                    ClipRRect(
                      borderRadius: 8.radiusAll,
                      child: Image.asset(
                        'assets/icons/${widget.image}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 120,
                      ),
                    ),
                    8.verticalSpace,
                    // Title and description below image
                    Text(
                      widget.title,
                      style: Theme.of(context).styles.headingMedium.copyWith(
                        color: isHovered
                            ? Theme.of(context).themeColors.primaryLight
                            : Colors.white,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    6.verticalSpace,
                    Text(
                      widget.description,
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                        color: Theme.of(context).themeColors.disabledButton,
                        fontSize: 12,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: Theme.of(context).styles.headingMedium.copyWith(
                              color: isHovered
                                  ? Theme.of(context).themeColors.primaryLight
                                  : Colors.white,
                              fontSize: 18,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          8.verticalSpace,
                          Text(
                            widget.description,
                            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                              color: Theme.of(context).themeColors.disabledButton,
                              fontSize: 14,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: 8.radiusAll,
                        child: Image.asset(
                          'assets/icons/${widget.image}',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Read more",
                    style: TextStyle(
                      color: Theme.of(context).themeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 12 : 14,
                    ),
                  ),
                  (widget.isMobile ? 2 : 4).horizontalSpace,
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).themeColors.primaryColor,
                    size: widget.isMobile ? 14 : 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
