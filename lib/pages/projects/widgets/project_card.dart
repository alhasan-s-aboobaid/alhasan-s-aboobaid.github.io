
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Sizes sizes;
  final String title;
  ProjectCard({required this.sizes, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.web, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: sizes.subtitleFontSize, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("A cool project showcasing Flutter", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("View", style: TextStyle(fontSize: sizes.buttonFontSize)),
            ),
          ],
        ),
      ),
    );
  }
}
