import 'package:college_app/screen/course_screen.dart';
import 'package:college_app/screen/pdf_list_screen.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: Center(
        child: Text('Video Screen'),
      ),
    );
  }
}

class PyqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Year Questions'),
      ),
      body: Center(
        child: Text('Pyq Screen'),
      ),
    );
  }
}

class StudyVideoPyqScreen extends StatefulWidget {
  const StudyVideoPyqScreen({Key? key}) : super(key: key);

  @override
  _StudyVideoPyqScreenState createState() => _StudyVideoPyqScreenState();
}

class _StudyVideoPyqScreenState extends State<StudyVideoPyqScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PdfListScreen(),
    CourseScreeen('Flutter'),
    PyqScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'PYQ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
