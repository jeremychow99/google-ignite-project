import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[CurDateTime(), const Expanded(child: toDoWidget())],
        ),
      ),
    );
  }
}

class toDoWidget extends StatefulWidget {
  const toDoWidget({super.key});

  @override
  State<toDoWidget> createState() => _MyWidgetState();
}

final List<int> _list = List.generate(10, (i) => i);
final List<bool> _selected = List.generate(10, (i) => false);

class _MyWidgetState extends State<toDoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                  tileColor:
                  _selected[index] ? Colors.green[900] : Colors.orange[700],
                  onTap: () =>
                      setState(() => _selected[index] = !_selected[index]),
                  title: Text("List item $index")));
        });
  }
}

class CurDateTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            greetingMessage(),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(getCurrentDate(),
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 0, 115, 130)))
        ],
      ),
    );
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 11.59) {
      return 'Good Morning';
    } else if (timeNow > 12 && timeNow <= 16) {
      return 'Good Afternoon';
    } else if (timeNow > 16 && timeNow < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}