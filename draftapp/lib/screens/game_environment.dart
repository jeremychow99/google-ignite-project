import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dailytasks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Map<String, Color> myColors = {
  "primary": Color.fromRGBO(0, 158, 199, 1)
};

class GameEnvironment extends StatefulWidget {
  const GameEnvironment({super.key});

  @override
  State<StatefulWidget> createState() {
    return GameEnvironmentState();
  }
}

class GameEnvironmentState extends State<GameEnvironment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: myAppBar(),
      ),
      backgroundColor: myColors["primary"],
      body: const _Body(),
    );
  }
}

Widget myAppBar() {
  return AppBar (
    title: const Text("ACT"),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w800,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 27,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    actions: const [
      IconButton(
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
            size: 37,),
        onPressed: null,
      ),
    ],
  );
}

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

Widget buildHeaders(BuildContext context) => Container(
  color: myColors["primary"],
  padding: const EdgeInsets.all(20),
  child: Column(
    children: const [
      CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage("assets/logo.jpg"),
      ),
      SizedBox(height: 5,),
      Text('ACT', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
      Text('Be consistent', style: TextStyle(color: Colors.white),)
    ],
  ),
);

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
        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ToDoList()));},
      ),
      const Divider(color: Colors.black54,),
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

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<_Body> {
  int health = 16;
  int condition = 25;
  int water = 5;
  int cleanliness = 10;
  int survivability = 10;
  int backgroundIndex = 0;

  var backgrounds = [
    {"image": 'assets/Background1.png'},
    {"image": 'assets/Background2.png'},
    {"image": 'assets/Background3.png'},
    {"image": 'assets/Background4.png'},
    {"image": 'assets/Background5.png'},
    {"image": 'assets/Background6.png'},
    {"image": 'assets/Background7.png'},
    {"image": 'assets/Background8.png'},
    {"image": 'assets/Background9.png'},
    {"image": 'assets/Background10.png'},
    {"image": 'assets/Background11.png'},
    {"image": 'assets/Background12.png'},
    {"image": 'assets/Background13.png'},
    {"image": 'assets/Background14.png'},
    {"image": 'assets/Background15.png'},
    {"image": 'assets/Background16.png'},
    {"image": 'assets/Background17.png'},
    {"image": 'assets/Background18.png'},
    {"image": 'assets/Background19.png'},
    {"image": 'assets/Background20.png'},
    {"image": 'assets/Background20.png'},
  ];

  var bear = [
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_worst.png'},
    {"emotion": 'assets/polarbear_depressed.png'},
    {"emotion": 'assets/polarbear_depressed.png'},
    {"emotion": 'assets/polarbear_depressed.png'},
    {"emotion": 'assets/polarbear_depressed.png'},
    {"emotion": 'assets/polarbear_depressed.png'},
    {"emotion": 'assets/polarbear_sad.png'},
    {"emotion": 'assets/polarbear_sad.png'},
    {"emotion": 'assets/polarbear_sad.png'},
    {"emotion": 'assets/polarbear_sad.png'},
    {"emotion": 'assets/polarbear_sad.png'},
    {"emotion": 'assets/polarbear_happy.png'},
    {"emotion": 'assets/polarbear_happy.png'},
    {"emotion": 'assets/polarbear_happy.png'},
    {"emotion": 'assets/polarbear_happy.png'},
    {"emotion": 'assets/polarbear_happy.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            color: Colors.cyanAccent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image(image: AssetImage(backgrounds[backgroundIndex]['image'].toString()),fit: BoxFit.contain,),
                      Positioned(
                        left: 180,
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 390,
                          width: 100,
                          child: const Image(image: AssetImage('assets/polarBear.png'),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        ),
        Expanded(
          flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(35, 5, 0, 2),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(bear[backgroundIndex]["emotion"].toString()),
                          ),
                          const SizedBox(width: 7,),
                          const Text(
                            'A CutePolarBear',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                health = health+4;
                                condition = condition+3;
                                water = water+4;
                                cleanliness = cleanliness+4;
                                survivability = survivability+4;
                                backgroundIndex ++;
                              });
                            },
                            child: const Icon(
                              Icons.ac_unit,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      title: const Text("Congratulations!"),
                                      content: SizedBox(
                                        width: 300,
                                        height: 145,
                                        child: Column(
                                          children: [
                                            const Text("5/5 tasks completed You gained:"),
                                            const Text("Health +4"),
                                            const Text("Condition +4"),
                                            const Text("Water Purity +5"),
                                            const SizedBox(height: 10,),
                                            const Text("Share with you friends!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 15,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                              Icon(Icons.share),
                                              Icon(FontAwesomeIcons.facebook),
                                              Icon(FontAwesomeIcons.instagram),
                                              Icon(FontAwesomeIcons.twitter),
                                              Icon(FontAwesomeIcons.telegram),
                                              Icon(FontAwesomeIcons.whatsapp)
                                            ],)
                                          ],
                                        ),
                                      ),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text("Great!"))
                                      ],
                                    ),
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.listCheck,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 13.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white,
                            ),
                            child: const SizedBox(
                              child: Text(
                                'Health',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: 270,
                            lineHeight: 13,
                            percent: health*0.01,
                            center: Text('$health%', style: const TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: health*0.01),
                            backgroundColor: Colors.grey[300],
                            animation: false,
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            height: 13.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white,
                            ),
                            child: const SizedBox(
                              child: Text(
                                'Condition',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: 270,
                            lineHeight: 13,
                            percent: condition*0.01,
                            center: Text('$condition%', style: const TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: condition*0.01),
                            backgroundColor: Colors.grey[300],
                            animation: false,
                          ),
                        ],
                      )
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                    child: Text(
                      'The Environment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            height: 13.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white,
                            ),
                            child: const SizedBox(
                              child: Text(
                                'Water Purity',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: 270,
                            lineHeight: 13,
                            percent: water*0.01,
                            center: Text('$water%', style: const TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: water*0.01),
                            backgroundColor: Colors.grey[300],
                            animation: false,
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[Container(
                          width: 80.0,
                          height: 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white,
                          ),
                          child: const SizedBox(
                            child: Text(
                              'Cleanliness',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                          LinearPercentIndicator(
                            width: 270,
                            lineHeight: 13,
                            percent: cleanliness*0.01,
                            center: Text('$cleanliness%', style: const TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: cleanliness*0.01),
                            backgroundColor: Colors.grey[300],
                            animation: false,
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[Container(
                          width: 80.0,
                          height: 13.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white,
                          ),
                          child: const SizedBox(
                            child: Text(
                              'Survivability',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                          ),
                        ),

                          LinearPercentIndicator(
                            width: 270,
                            lineHeight: 13,
                            percent: survivability*0.01,
                            center: Text('$survivability%', style: const TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: survivability*0.01),
                            backgroundColor: Colors.grey[300],
                            animation: false,
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {Navigator.of(context).push(_todoListRoute());},
                              iconSize: 52,
                              color: Colors.black,
                              icon: const Icon(Icons.expand_less_sharp),
                            ),
                            const Text("Daily tasks")
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),
        ),
      ],
    );
  }
}

Route _todoListRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ToDoList(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Color calculateBackgroundColor({required double value}) {
  if (value >= 0.80) {
    return Colors.teal;
  } else if (value >= 0.40) {
    return Colors.orange;
  } else {
    return Colors.redAccent;
  }
}

