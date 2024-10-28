class Exercise {
  Exercise({
    required this.name,
    this.isCompleted = false,
    required this.timer,
  });
  final String name;
  bool isCompleted;
  double timer;
}
