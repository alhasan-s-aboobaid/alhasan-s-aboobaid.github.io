import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';

class Project {
  final String name;
  final String description;
  final String image;
  final String companyLogo;
  final String link;
  final String github;
  final List<String> techStack;
  final String role;
  final String year;
  final List<String> highlights;

  Project({
    required this.name,
    required this.description,
    required this.image,
    required this.companyLogo,
    required this.link,
    this.github = '',
    required this.techStack,
    required this.role,
    required this.year,
    required this.highlights,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'companyLogo': companyLogo,
      'link': link,
      'github': github,
      'techStack': techStack,
      'role': role,
      'year': year,
      'highlights': highlights,
    };
  }

  static List<Map<String, dynamic>> getProjects() {
    return [
      {
        'name': 'Maids.cc Client App',
        'description': 'Get a full-time maid or a maid visa. Sign & pay online in 5 minutes.'
            ' Avoid visits to medical centers & typists. Cancel anytime. Winner ministry award.\n\n'
            'To apply for your maid\'s visa, Just upload your maid\'s passport copy & photo. We\'ll handle the entire visa process and deliver your maid\'s passport with her visa stamped.\n\n'
            'To get a full-time maid today, view maids videos and hire your favorite. We\'ll Uber your new maid to you.',
        'image': 'maidsapp1.png',
        'companyLogo': IconManager.maidsccLogo,
        'link': 'https://play.google.com/store/apps/details?id=cc.maids.app&hl=en',
        'github': '',
        'techStack': ['Flutter', 'Firebase', 'REST API', 'Google Maps', 'Payment Gateway'],
        'role': 'Lead Mobile Developer',
        'year': '2022',
        'highlights': [
          'Implemented real-time tracking for maids',
          'Integrated multiple payment gateways',
          'Built a custom chat system',
          'Optimized app performance for low-end devices'
        ]
      },
      {
        'name': 'ElectroMall',
        'description':
            'ElectroMall was the first one-of-its kind large format specialist retail store that catered to all multi-brand\ndigital gadgets and home electronic needs in Iraq.\n\nSince its inception, ElectroMall has almost become synonyms for all electronics needs, with its tech-savvy staff, product range, Staged presence and the will to help customers.',
        'image': 'electroapp.png',
        'companyLogo': IconManager.electromall,
        'link': 'https://play.google.com/store/apps/details?id=com.electromall.app&hl=en',
        'github': '',
        'techStack': ['Flutter', 'Bloc', 'REST API', 'SQLite', 'Firebase'],
        'role': 'Senior Flutter Developer',
        'year': '2021',
        'highlights': [
          'Built a responsive e-commerce platform',
          'Implemented advanced product filtering',
          'Created a robust offline-first architecture',
          'Integrated analytics and crash reporting'
        ]
      },
      {
        'name': 'kelshimall كلشي مول',
        'companyLogo': IconManager.kelshimall,
        'description':
            'The Kalshi Mall project is an online marketplace that allows users to sell anything in a smooth and easy way through the website or application on Android and iPhone.\n\nThe goal of the project is to create an easy-to-handle electronic interface, where the user can advertise his goods or the things to be sold and reach the largest possible segment that may be interested in buying it.',
        'image': 'kelshimall.jpg',
        'link': 'https://play.google.com/store/apps/details?id=com.keshi_mall.klshi_mall&hl=en',
        'github': '',
        'techStack': ['Flutter', 'Provider', 'REST API', 'Firebase', 'Push Notifications'],
        'role': 'Mobile Developer',
        'year': '2020',
        'highlights': [
          'Implemented a marketplace with user-to-user chat',
          'Built a robust image upload and caching system',
          'Created a dynamic category filtering system',
          'Integrated location-based search'
        ]
      },
    ];
  }
}
