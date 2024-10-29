class Exercise {
  Exercise(
      {required this.name,
      this.isCompleted = false,
      required this.timer,
      required this.image});
  final String name;
  bool isCompleted;
  String image;
  double timer;
}
