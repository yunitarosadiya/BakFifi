import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  // ...
  final Habit habit;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        habit.title,
        style: TextStyle(
          decoration: habit.isDone ? TextDecoration.lineThrough : null,
          color:
              habit.isDone
                  ? Colors.grey
                  : Colors.black, // Menambahkan warna teks
        ),
      ),
      leading: GestureDetector(
        onTap: onChanged, // GestureDetector menggantikan Checkbox
        child: Icon(
          habit.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color:
              habit.isDone
                  ? Colors.green
                  : null, // Menambahkan warna hijau jika selesai
        ),
      ),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
    );
  }
}