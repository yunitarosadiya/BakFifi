import 'package:flutter/material.dart';

void showAddHabitDialog(BuildContext context, Function(String) onAdd) {
  String newHabit = '';

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Tambah Kebiasaan'),
      content: TextField(
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Contoh: Minum air putih'),
        onChanged: (value) => newHabit = value,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            // Validasi jika input tidak kosong dan lebih dari 3 karakter
            if (newHabit.trim().isNotEmpty) {
              onAdd(newHabit);
              Navigator.pop(context);
            } else {
              // Menampilkan SnackBar jika input kosong
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nama kebiasaan tidak boleh kosong')),
              );
            }
          },
          child: const Text('Tambah'),
        ),
      ],
    ),
  );
}