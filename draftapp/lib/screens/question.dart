import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'game_environment.dart';

const Map<String, Color> myColors = {
  "primary": Color.fromRGBO(0, 158, 199, 1)
};

class Questionnaire extends StatelessWidget {
  const Questionnaire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Questionnaire'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<QuestionFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: ConditionalQuestions(
        key: _key,
        children: questions(),
        trailing: [
          MaterialButton(
            color: Colors.blue,
            splashColor: Colors.white,
            onPressed: () async {
              if (_key.currentState!.validate()) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GameEnvironment()));
              }
            },
            child: const Text("Submit Questionnaire", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          )
        ],
        leading: const [Text("Complete ALL 10 questions")],
      ),
    );
  }
}

List<Question> questions() {
  return [
    PolarQuestion(
        question: "Do you support and contribute to recycling, reusing and reducing waste?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Do you use plastic containers or glass jars to store food?",
        answers: ["Yes", "No"]),
    PolarQuestion(
        question: "Do you separate your trash according to wet waste, plastics, paper glass, etc?",
        answers: ["Yes", "No"]),
    PolarQuestion(
        question: "Do you turn off the lights whenever you leave a room?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Do you leave the water running when you brush your teeth?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "When you dine out, do you use a plastic straw for your drink?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Do you take reusable tote bags with you when you shop?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Do you know about the UN Sustainable Development Goals and their importance?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Do you prefer and support sustainable brands while shopping for food, clothes, etc.?",
        answers: ["Yes", "No"],
        isMandatory: true),
    PolarQuestion(
        question: "Lastly, are you ready to be a more environmentally friendly citizen by the use of ACT app?",
        answers: ["Yes", "No"],
        isMandatory: true),
  ];
}