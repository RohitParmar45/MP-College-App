class UserCourseModel {
  final String course_name;
  final String course_id;

  UserCourseModel({required this.course_name, required this.course_id});

  factory UserCourseModel.fromMap(Map<String, dynamic> data) {
    return UserCourseModel(
      course_name: data['course_name'] ?? '',
      course_id: data['course_id'] ?? '',

    );
  }
}
