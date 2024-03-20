import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/model/subject_model.dart';
import 'package:college_app/screen/see_all_course.dart';
import 'package:college_app/screen/std_video_pyq/std_video_pyq_screen.dart';
import 'package:college_app/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user_course_model.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  List<Color> catColors = [
    Color(0xFFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84FB),
    Color(0xFF78E667),
  ];

  // List<Icon> catIcons = [
  //   Icon(
  //     Icons.category,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  //   Icon(
  //     Icons.video_library,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  //   Icon(
  //     Icons.assignment,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  //   Icon(
  //     Icons.store,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  //   Icon(
  //     Icons.play_circle_fill,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  //   const Icon(
  //     Icons.emoji_events,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  // ];

  // List imgList = ["Flutter", "React_Native", "Flutter", "Python"];

// Fetch data from Firestore
//   Future<List<Subject_Model>> fetchData() async {
//     List<Subject_Model> subjects = [];
//
//     try {
//       // Access Firestore collection
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('courses')
//           .doc('btech')
//           .collection('cse')
//           .doc('computer_network')
//           .collection(
//               'pyq') // if `title`, `subtitle`, and `link` are nested under a subcollection
//           .get();
//
//       // Iterate through documents and extract data
//       querySnapshot.docs.forEach((doc) {
//         // Convert each document to a SubjectModel object
//         // Convert each document to a SubjectModel object
//         Subject_Model subject =
//         Subject_Model.fromMap(doc.data() as Map<String, dynamic>);
//         subjects.add(subject);
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//
//     return subjects;
//   }

   String ? userIdd ;
  Future<List<UserCourseModel>> _getUserData() async {
    // Fetch user ID from LocalDatabase
    String? userId = await LocalDatbase().getUserId();
    userIdd = userId;
    if (userId == null) {
      return [];
    }

    // Fetch data from Firestore using the unique ID
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("tEtNlrQBjxdL7hXL1ShQsdO8Nop1") // Await the userId before using it
        .collection('courses')
        .get();


    print("userId  $userId" );
    // Convert the Firestore data to a list of Subject_Model objects
    List<UserCourseModel> coursesList = snapshot.docs.map((doc) => UserCourseModel.fromMap(doc.data())).toList();

    return coursesList;
  }

  @override
  void initState() {
    DatabaseService databaseService = DatabaseService();
    databaseService.auth;
    databaseService.firestore;
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 15),
                  child: InkWell(
                    child: const Text(
                      textAlign: TextAlign.start,
                      "Hi, Vivek",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          wordSpacing: 2,
                          color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyVideoPyqScreen(),
                          ));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 25,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Course",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: ()  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(userIdd!))
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SeeAllCourse();
                    }));
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF674AEF)),
                  ),
                )
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(children: [
              FutureBuilder<List<UserCourseModel>>(
                future: _getUserData(),
                builder: (context, AsyncSnapshot<List<UserCourseModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: catColors[index],
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.library_books,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data![index].course_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ]),
          )

        ],
      ),
    );
  }
}
