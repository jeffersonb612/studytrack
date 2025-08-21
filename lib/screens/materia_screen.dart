import 'package:flutter/material.dart';
import '../models/sessao_estudo.dart';

class MateriaScreen extends StatefulWidget {
  final SessaoEstudo sessao;

  const MateriaScreen({super.key, required this.sessao});

  @override
  State<MateriaScreen> createState() => _MateriaScreenState();
}

class _MateriaScreenState extends State<MateriaScreen> {
  late TextEditingController materiaController;
  late TextEditingController topicoController;
  late TextEditingController duracaoController;
  late TextEditingController anotacoesController;

  @override
  void initState() {
    super.initState();
    materiaController = TextEditingController(text: widget.sessao.materia);
    topicoController = TextEditingController(text: widget.sessao.topico);
    duracaoController = TextEditingController(text: widget.sessao.duracao);
    anotacoesController = TextEditingController(text: widget.sessao.anotacoes);
  }

  @override
  void dispose() {
    materiaController.dispose();
    topicoController.dispose();
    duracaoController.dispose();
    anotacoesController.dispose();
    super.dispose();
  }

  void salvar() {
    final sessaoEditada = SessaoEstudo(
      materia: materiaController.text,
      topico: topicoController.text,
      duracao: duracaoController.text,
      anotacoes: anotacoesController.text,
      dataEstudo: widget.sessao.dataEstudo
    );
    Navigator.pop(context, sessaoEditada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Matéria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: salvar,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: materiaController,
              decoration: const InputDecoration(labelText: 'Matéria'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: topicoController,
              decoration: const InputDecoration(labelText: 'Tópico'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: duracaoController,
              decoration: const InputDecoration(labelText: 'Duração'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: anotacoesController,
              decoration: const InputDecoration(
                labelText: 'Anotações',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
