import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = Quiz();
  List<Icon> marcador = [];
  int resultado = 0;

  _onBasicAlertPressed(context) {
    Alert(
        context: context,
        title: "Quiz",
        desc: "Você acertou $resultado de ${quiz.perguntas.length}",
        buttons: [
          DialogButton(
            child: Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {
              quiz.reiniciaQuiz(),
              marcador.clear(),
              Navigator.pop(context),
              resultado = 0,
              setState(() {
                quiz.getTextoPergunta();
              })
            },
            width: 120,
          )
        ]).show();
  }

  addCheck(IconData icon, Color color) {

    if (marcador.length >= quiz.perguntas.length) {
      return;
    }
    setState(() {
      marcador.add(Icon(
        icon,
        color: color,
      ));
    });

  }

  void conferirResposta(bool resposta) {
    if (resposta == quiz.getRespostaPergunta()) {
      addCheck(Icons.check, Colors.green);
      resultado++;
    } else {
      addCheck(Icons.close, Colors.red);
    }

    if (quiz.temPergunta()) {
      quiz.nextPergunta();
      setState(() {
        quiz.getTextoPergunta();
      });
    }else{
      _onBasicAlertPressed(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getTextoPergunta(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcador,
        )
      ],
    );
  }
}
