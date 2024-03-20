import 'package:college_app/screen/ai_chat_bot/consts.dart';
import 'package:college_app/screen/course_screen.dart';
import 'package:college_app/screen/pdf_list_screen.dart';
import 'package:college_app/screen/pdf_screen.dart';
import 'package:college_app/screen/see_all_course.dart';
import 'package:college_app/screen/std_video_pyq_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  // List favouriteList = [
  //   "Computer Networking",
  //   "Data Structure",
  //   "DBMS",
  //   "Theory of Computation",
  //   "Software Engineering",
  //   "Cryptography"
  // ];

  List<Color> catColors = [
    Color(0xFFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84FB),
    Color(0xFF78E667),
  ];

  List<Icon> catIcons = [
    Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.video_library,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.assignment,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.store,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.emoji_events,
      color: Colors.white,
      size: 30,
    ),
  ];

  List imgList = ["Flutter", "React_Native", "Flutter", "Python"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
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
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 15),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Course",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SeeAllCourse();
                    }));
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF674AEF)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(children: [
              GridView.builder(
                itemCount: favouriteList.length,
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
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        favouriteList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7)),
                      )
                    ],
                  );
                },
              ),

              // const SizedBox(
              //   height: 10,
              // ),

              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio:
              //         (MediaQuery.of(context).size.height - 50 - 25) /
              //             (4 * 240),
              //     mainAxisSpacing: 10,
              //     crossAxisSpacing: 10,
              //   ),
              //   itemCount: imgList.length,
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => CourseScreeen(imgList[index]),
              //             ));
              //       },
              //       child: Container(
              //         padding:
              //             EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: Color(0xFFF5F3FF),
              //         ),
              //         child: Column(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.all(10),
              //               child: Image.asset(
              //                 // 'assets/image/study_chair.png',
              //                 "assets/image/${imgList[index]}.png",
              //                 width: 80,
              //                 height: 80,
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Text(
              //               imgList[index],
              //               style: TextStyle(
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.black.withOpacity(0.6),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Text(
              //               "55 Videos",
              //               style: TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.black.withOpacity(0.5),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // )
            ]),
          )
        ],
      ),
    );
  }
}
