import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/sessao_estudo.dart';

class EstatisticasScreen extends StatelessWidget {
  final List<SessaoEstudo> sessoes;

  const EstatisticasScreen({super.key, required this.sessoes});

  @override
  Widget build(BuildContext context) {
    final revisoesData = <BarChartGroupData>[];
    for (int i = 0; i < sessoes.length; i++) {
      revisoesData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: sessoes[i].revisoes.toDouble(),
              color: Colors.deepPurple,
              width: 20,
            ),
          ],
        ),
      );
    }

    final totalRevisoes = sessoes.fold<int>(
        0, (prev, sessao) => prev + sessao.revisoes);
    final totalRevisoesPendentes = sessoes.length * 3 - totalRevisoes;

    return Scaffold(
      appBar: AppBar(title: const Text("Estatísticas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Revisões por Tópico",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < sessoes.length) {
                            return Text(sessoes[value.toInt()].topico,
                                style: const TextStyle(fontSize: 12));
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  barGroups: revisoesData,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Revisões Concluídas: $totalRevisoes de ${sessoes.length * 3}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Pendentes: $totalRevisoesPendentes",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
