import 'package:flutter/material.dart';

class EstatisticasScreen extends StatelessWidget {
  const EstatisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estatísticas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Horas Estudadas (Esta Semana)",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: Placeholder(), // Aqui pode colocar gráfico depois
            ),
            const SizedBox(height: 16),
            const Text("Revisões Concluídas"),
            const Text(
              "4 de 10",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
