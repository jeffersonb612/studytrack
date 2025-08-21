import 'package:hive/hive.dart';

part 'sessao_estudo.g.dart'; // arquivo gerado automaticamente

@HiveType(typeId: 0)
class SessaoEstudo extends HiveObject {
  @HiveField(0)
  String materia;

  @HiveField(1)
  String topico;

  @HiveField(2)
  String duracao; // duração em minutos

  @HiveField(3)
  String anotacoes;

  @HiveField(4)
  DateTime dataEstudo;

  @HiveField(5)
  bool concluida; // se a sessão foi concluída

  @HiveField(6)
  int revisoes; // número de revisões concluídas (0 a 3)

  SessaoEstudo({
    required this.materia,
    required this.topico,
    required this.duracao,
    required this.anotacoes,
    required this.dataEstudo,
    this.concluida = false,
    this.revisoes = 0,
  });

  /// Datas de revisão baseadas na técnica espaçada (1, 7, 30 dias)
  List<DateTime> getDatasRevisao() {
    return [
      dataEstudo.add(const Duration(days: 1)),
      dataEstudo.add(const Duration(days: 7)),
      dataEstudo.add(const Duration(days: 30)),
    ];
  }

  int get duracaoEmMinutos => int.tryParse(duracao) ?? 0;

  int revisoesConcluidas() => revisoes;
}
