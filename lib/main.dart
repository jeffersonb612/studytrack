import 'package:flutter/material.dart';
import 'screens/resumo_do_dia_screen.dart';
import 'screens/nova_sessao_screen.dart';
import 'screens/revisoes_screen.dart';
import 'screens/estatisticas_screen.dart';
import 'models/sessao_estudo.dart';
import 'screens/materia_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyTrack',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _paginaAtual = 0;

  final List<SessaoEstudo> materiasCadastradas = [];

  void adicionarMateria(SessaoEstudo novaSessao) {
    setState(() {
      materiasCadastradas.add(novaSessao);
    });
  }

  void editarMateria(int index, SessaoEstudo sessaoEditada) {
    setState(() {
      materiasCadastradas[index] = sessaoEditada;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> telas = [
      ResumoDoDiaScreen(
        sessoes: materiasCadastradas,
        onEditar: (index) async {
          final sessaoAtual = materiasCadastradas[index];
          final sessaoEditada = await Navigator.push<SessaoEstudo>(
            context,
            MaterialPageRoute(
              builder: (_) => MateriaScreen(sessao: sessaoAtual),
            ),
          );
          if (sessaoEditada != null) {
            editarMateria(index, sessaoEditada);
          }
        },
      ),
      NovaSessaoScreen(
        onAdicionarMateria: adicionarMateria,
      ),
      RevisoesScreen(
        sessoes: materiasCadastradas, // agora recebe a lista de sessões
      ),
      EstatisticasScreen(
        sessoes: materiasCadastradas, // agora recebe a lista de sessões
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(['Resumo', 'Nova Sessão', 'Revisões', 'Estatísticas'][_paginaAtual]),
      ),
      body: telas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        onTap: (index) {
          setState(() {
            _paginaAtual = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Resumo'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Nova Sessão'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Revisões'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Estatísticas'),
        ],
      ),
    );
  }
}
