import 'package:flutter/material.dart';

class PhysicsChapter {
  final String name;
  final String subtitle;

  PhysicsChapter({required this.name, required this.subtitle});
}

class PdfListScreen extends StatelessWidget {
  final List<PhysicsChapter> chapters = [
    PhysicsChapter(
        name: 'Chapter 1: Introduction to Physics',
        subtitle: 'Understanding the basics of physics'),
    PhysicsChapter(
        name: 'Chapter 2: Mechanics', subtitle: 'Study of motion and forces'),
    PhysicsChapter(
        name: 'Chapter 3: Thermodynamics', subtitle: 'Heat, energy, and work'),
    PhysicsChapter(
        name: 'Chapter 4: Electromagnetism',
        subtitle: 'Electricity and magnetism'),
    PhysicsChapter(
        name: 'Chapter 5: Modern Physics',
        subtitle: 'Quantum mechanics and relativity'),
  ];

  PdfListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Material : Physics'),
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            child: ListTile(
              leading: Image.asset(
                  'assets/image/pdf_icon.png'), // Placeholder for PDF icon
              title: Text(chapters[index].name),
              subtitle: Text(chapters[index].subtitle),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      // Implement download PDF logic
                      // Example: launch a download URL
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      // Implement view PDF logic
                      // Example: navigate to a PDF viewer screen
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
