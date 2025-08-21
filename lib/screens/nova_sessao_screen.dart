import 'package:flutter/material.dart';
import '../models/sessao_estudo.dart';

class NovaSessaoScreen extends StatefulWidget {
  final Function(SessaoEstudo novaSessao) onAdicionarMateria;

  const NovaSessaoScreen({super.key, required this.onAdicionarMateria});

  @override
  State<NovaSessaoScreen> createState() => _NovaSessaoScreenState();
}

class _NovaSessaoScreenState extends State<NovaSessaoScreen> {
  final TextEditingController materiaController = TextEditingController();
  final TextEditingController topicoController = TextEditingController();
  final TextEditingController duracaoController = TextEditingController(text: "1:30:00");
  final TextEditingController anotacoesController = TextEditingController();

  void salvar() {
    final novaSessao = SessaoEstudo(
      materia: materiaController.text.trim(),
      topico: topicoController.text.trim(),
      duracao: duracaoController.text.trim(),
      anotacoes: anotacoesController.text.trim(),
      dataEstudo: DateTime.now(), // Campo adicionado
    );

    if (novaSessao.materia.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, preencha o nome da matéria.")),
      );
      return;
    }

    widget.onAdicionarMateria(novaSessao);

    // Limpa os campos
    materiaController.clear();
    topicoController.clear();
    duracaoController.text = "1:30:00";
    anotacoesController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sessão adicionada com sucesso!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Sessão")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: materiaController,
              decoration: const InputDecoration(labelText: "Matéria"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: topicoController,
              decoration: const InputDecoration(labelText: "Tópico"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: duracaoController,
              decoration: const InputDecoration(labelText: "Duração"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: anotacoesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Anotações",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: salvar,
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
