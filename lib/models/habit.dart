class Habit {
  String title;
  bool isDone;

  Habit({required this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }
}