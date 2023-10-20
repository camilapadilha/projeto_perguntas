import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 15) {
      return 'Parabéns!';
    } else if (pontuacao < 30) {
      return 'Você é bom!';
    } else if (pontuacao < 40) {
      return 'Você é o cara!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text('Reiniciar?'),
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
