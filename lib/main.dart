import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 20},
        {'texto': 'Vermelho', 'pontuacao': 30},
        {'texto': 'Amarelo', 'pontuacao': 40}
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 20},
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 25},
      ],
    },
    {
      'texto': 'Qual é sua comida favorita?',
      'respostas': [
        {'texto': 'Macarrão', 'pontuacao': 10},
        {'texto': 'Lasanha', 'pontuacao': 30},
        {'texto': 'Pastel', 'pontuacao': 20},
        {'texto': 'Coxinha', 'pontuacao': 5},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
