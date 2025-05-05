import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_tile.dart';
import '../widgets/add_habit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterOption { all, done, undone }

class _HomeScreenState extends State<HomeScreen> {
  final List<Habit> habits = [];
  FilterOption _filter = FilterOption.all;

  // Filter berdasarkan status habit
  List<Habit> get filteredHabits {
    switch (_filter) {
      case FilterOption.done:
        return habits.where((h) => h.isDone).toList();
      case FilterOption.undone:
        return habits.where((h) => !h.isDone).toList();
      default:
        return habits;
    }
  }

  // Menambah habit baru
  void addHabit(String title) {
    setState(() {
      habits.add(Habit(title: title));
    });
  }

  // Toggle status habit (selesai/belum selesai)
  void toggleHabit(Habit habit) {
    setState(() {
      habit.toggleStatus();
    });
  }

  // Menghapus habit
  void deleteHabit(Habit habit) {
    setState(() {
      habits.remove(habit);
    });
  }

  // Mengubah filter yang aktif (all, done, undone)
  void changeFilter(FilterOption? value) {
    if (value != null) {
      setState(() {
        _filter = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        actions: [
          // Popup menu untuk memilih filter
          PopupMenuButton<FilterOption>(
            onSelected: changeFilter,
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: FilterOption.all,
                    child: Text('Semua'),
                  ),
                  const PopupMenuItem(
                    value: FilterOption.done,
                    child: Text('Selesai'),
                  ),
                  const PopupMenuItem(
                    value: FilterOption.undone,
                    child: Text('Belum Selesai'),
                  ),
                ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredHabits.length,
        itemBuilder: (context, index) {
          final habit = filteredHabits[index];
          // Menggunakan widget HabitTile untuk setiap habit
          return HabitTile(
            habit: habit,
            onChanged: () => toggleHabit(habit),
            onDelete: () => deleteHabit(habit),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddHabitDialog(context, addHabit),
        child: const Icon(Icons.add),
      ),
    );
  }
}