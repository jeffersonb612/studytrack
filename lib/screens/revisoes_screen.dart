import 'package:flutter/material.dart';
import '../models/sessao_estudo.dart';

class RevisoesScreen extends StatelessWidget {
  final List<SessaoEstudo> sessoes;

  const RevisoesScreen({super.key, required this.sessoes});

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
            Expanded(
              child: ListView.builder(
                itemCount: sessoes.length,
                itemBuilder: (context, index) {
                  final sessao = sessoes[index];
                  return ListTile(
                    title: Text(sessao.topico),
                    subtitle: Text(sessao.materia),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (i) {
                        return IconButton(
                          icon: Icon(
                            Icons.check,
                            color: sessao.revisoes > i
                                ? Colors.green
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (i == 0 || sessao.revisoes >= i) {
                              sessao.revisoes = i + 1;
                              (context as Element).markNeedsBuild();
                            }
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
