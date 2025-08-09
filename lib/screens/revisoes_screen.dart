import 'package:flutter/material.dart';

class RevisoesScreen extends StatelessWidget {
  const RevisoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Revisões Pendentes")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
              onDateChanged: (date) {},
            ),
            const SizedBox(height: 16),
            const ListTile(
              title: Text("Equações Lineares"),
              subtitle: Text("Matemática - 1 dia"),
            ),
            const Divider(),
            const ListTile(
              title: Text("Outros tópicos"),
              subtitle: Text("Nesta semana"),
            ),
          ],
        ),
      ),
    );
  }
}
