import 'dart:io';

class Question {
  String question;
  String answer;

  Question(this.question, this.answer);
}

class Quiz {
  List<Question> questions;
  int score = 0;

  Quiz(this.questions);

  void start() {
    print("=== Quiz Game ===");

    for (var question in questions) {
      print("\n${question.question}");
      stdout.write("Your answer: ");

      String userAnswer = stdin.readLineSync() ?? "";

      if (userAnswer.toLowerCase() == question.answer.toLowerCase()) {
        print("Correct!");
        score++;
      } else {
        print("Wrong! Correct answer: ${question.answer}");
      }
    }
  }

  void showScore() {
    print("\n=== Result ===");
    print("Score: $score/${questions.length}");
  }
}

void main() {
  List<Question> questions = [
    Question("What is the capital of Vietnam?", "Hanoi"),
    Question("What is 2 + 2?", "4"),
    Question("Which language is used by Flutter?", "Dart"),
  ];

  Quiz quiz = Quiz(questions);

  quiz.start();
  quiz.showScore();
}
