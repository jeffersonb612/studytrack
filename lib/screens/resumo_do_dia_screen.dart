import 'package:flutter/material.dart';
import '../models/sessao_estudo.dart';

class ResumoDoDiaScreen extends StatelessWidget {
  final List<SessaoEstudo> sessoes;
  final Function(int index) onEditar;

  const ResumoDoDiaScreen({
    super.key,
    required this.sessoes,
    required this.onEditar,
  });

  @override
  Widget build(BuildContext context) {
    if (sessoes.isEmpty) {
      return const Center(
        child: Text("Nenhuma matéria cadastrada hoje."),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sessoes.length,
      itemBuilder: (context, index) {
        final sessao = sessoes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              onEditar(index);
            },
            child: Text(
              sessao.materia,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
