import 'package:hive/hive.dart';

part 'sessao_estudo.g.dart'; // arquivo gerado automaticamente

@HiveType(typeId: 0)
class SessaoEstudo extends HiveObject {
  @HiveField(0)
  String materia;

  @HiveField(1)
  String topico;

  @HiveField(2)
  String duracao;

  @HiveField(3)
  String anotacoes;

  SessaoEstudo({
    required this.materia,
    required this.topico,
    required this.duracao,
    required this.anotacoes,
  });
}
