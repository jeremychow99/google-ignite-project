import 'package:flutter/material.dart';
import 'game_environment.dart';

//TODO FOR JEREMY'S PORTION, SEPARATE INTO SEPARATE DART FILE CAN CALL CLASS FROM THERE
//TODO SAME FOR NAV BAR ROUTING
class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'test',
        home: Scaffold(
          drawer: const NavigationDrawer(),
          // appBar: AppBar(
          //   title: const Text('test'),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                myAppBar(),
                CurDateTime(),
                Expanded(child: toDoWidget())
              ],
            ),
          ),
        ));
  }
}

class toDoWidget extends StatefulWidget {
  const toDoWidget({super.key});

  @override
  State<toDoWidget> createState() => _MyWidgetState();
}

final List<int> _list = List.generate(10, (i) => i);
final List<bool> _selected = List.generate(10, (i) => false);
final List<String> _taskList = [
  "Unplug unused electrical devices",
  "Reuse materials and make a DIY thing",
  "Turn off the water tap while brushing",
  "Cook and Eat one meal at home",
  "Donate your unused clothes to charity",
  "Use digital materials instead of paper",
  "Choose local produce",
  "Use leftover food for cooking",
  "Reuse materials and make a DIY thing",
  "Throw recyclables in designated bin"
];
final List<int> _numList = [3, 6, 7];
final List<int> _secondList = [0];

class _MyWidgetState extends State<toDoWidget> {
  int _itemCount = 0;
  var myIcon = Icon(Icons.recycling);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 20),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 0,
              child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  subtitle: Text('${_taskList[index]}'),
                  leading: _numList.contains(index)
                      ? Icon(Icons.restaurant)
                      : _secondList.contains(index)
                          ? Icon(Icons.bolt)
                          : myIcon,
                  textColor: Colors.white,
                  tileColor:
                      _selected[index] ? Colors.green[900] : Colors.orange[700],
                  onTap: () {
                    setState(() => _selected[index] = !_selected[index]);
                    setState(() {
                      _itemCount += 1;
                    });
                    if (_itemCount == 5) {
                      _itemCount = 0;
                      showAlertDialog(context);
                    }
                  },
                  title: Text("Task ${index + 1}")));
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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(getCurrentDate(),
              style: TextStyle(
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

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () async {
      Navigator.pop(context);
      await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const GameEnvironment()));
    },

  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Congratulations!"),
    content: const Text("You have completed the minimum number of required tasks. Keep it up!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        runSpacing: 16,
        children: [
          const ListTile(
            leading: Icon(Icons.sports_esports),
            title: Text("Game on!"),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rounded),
            title: const Text("Daily Tasks"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ToDoList()));
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          const ListTile(
            leading: Icon(Icons.military_tech_sharp),
            title: Text("Achievements"),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.storefront_outlined),
            title: Text("Store"),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.newspaper_outlined),
            title: Text("News"),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: null,
          )
        ],
      ),
    );

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeaders(context),
          buildMenuItems(context),
        ],
      ),
    );
  }
}
