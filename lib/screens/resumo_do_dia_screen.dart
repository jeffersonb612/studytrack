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
          child: ListTile(
            title: Text(sessao.materia),
            subtitle: Text(sessao.topico),
            trailing: Checkbox(
              value: sessao.concluida,
              onChanged: (val) {
                sessao.concluida = val ?? false;
                if (sessao.concluida && sessao.revisoes == 0) {
                  sessao.revisoes = 1; // primeira revisão concluída
                }
                (context as Element).markNeedsBuild();
              },
            ),
            onTap: () => onEditar(index),
          ),
        );
      },
    );
  }
}
