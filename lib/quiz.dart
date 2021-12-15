import 'dart:ffi';

import 'package:quiz/perguntas.dart';

class Quiz {
  List<Pergunta> perguntas = [
    Pergunta(
        'O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Pergunta('A culinária brasileira é uma das melhores do mundo.', true),
    Pergunta('Vacas podem voar, assim como peixes utilizam os pés para andar.',
        false),
    Pergunta('A maioria dos peixes podem viver fora da água.', false),
    Pergunta('A lâmpada foi inventada por um brasileiro.', false),
    Pergunta(
        'É possível utilizar a carteira de habilitação de carro para dirigir um avião.',
        false),
    Pergunta('O Brasil possui 26 estados e 1 Distrito Federal.', true),
    Pergunta(
        'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', true),
    Pergunta('1 minuto equivale a 60 segundos.', true),
    Pergunta('1 segundo equivale a 200 milissegundos.', false),
    Pergunta('O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.',
        true),
    Pergunta('Ler após uma refeição prejudica a visão humana.', false),
    Pergunta(
        'O cartão de crédito pode ser considerado uma moeda virtual.', false),
  ];
  int _index = 0;

  String getTextoPergunta() {
    return perguntas[_index].pergunta;
  }

  bool getRespostaPergunta() {
    return perguntas[_index].resposta;
  }

  bool temPergunta() {
    return _index < perguntas.length - 1 ? true : false;
  }

  void nextPergunta() {
    _index++;
  }

  void reiniciaQuiz() {
    _index = 0;
  }
}
