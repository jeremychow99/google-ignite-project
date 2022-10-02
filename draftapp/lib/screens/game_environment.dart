import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dailytasks.dart';

const Map<String, Color> myColors = {
  "primary": Color.fromRGBO(0, 158, 199, 1)
};

// Main environment build upon myAppBar() and _Body()
class GameEnvironment extends StatelessWidget {
   const GameEnvironment({Key? key}) : super(key: key);

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

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

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
                      const Image(image: AssetImage('assets/Background2.png'),),
                      Positioned(
                        left: 180,
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 390,
                          width: 100,
                          child: const Image(image: AssetImage('assets/polarBear.png'),),
                        ),
                      )
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
                      padding: const EdgeInsets.fromLTRB(35, 18, 0, 0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.ac_unit,
                            color: Colors.lightBlueAccent,
                          ),
                          const SizedBox(width: 7,),
                          const Text(
                            'A CutePolarBear',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 85,),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      title: const Text("#TODO"),
                                      content: const Text("#TODO content"),
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
                              Icons.security_update_good_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                            percent: 0.90,
                            center: const Text('90.0%', style: TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: 0.9),
                            backgroundColor: Colors.grey[300],
                            animation: true,
                            animationDuration: 1500,
                          ),
                        ],
                      )
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
                            percent: 0.80,
                            center: const Text('80.0%', style: TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: 0.8),
                            backgroundColor: Colors.grey[300],
                            animation: true,
                            animationDuration: 1500,
                          ),
                        ],
                      )
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
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
                            percent: 0.75,
                            center: const Text('75.0%', style: TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: 0.75),
                            backgroundColor: Colors.grey[300],
                            animation: true,
                            animationDuration: 1500,
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
                            percent: 0.80,
                            center: const Text('80.0%', style: TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: 0.8),
                            backgroundColor: Colors.grey[300],
                            animation: true,
                            animationDuration: 1500,
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
                            percent: 0.80,
                            center: const Text('80.0%', style: TextStyle(fontSize: 8),),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: calculateBackgroundColor(value: 0.8),
                            backgroundColor: Colors.grey[300],
                            animation: true,
                            animationDuration: 1500,
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: IconButton(
                    onPressed: () {Navigator.of(context).push(_todoListRoute());},
                    iconSize: 52,
                    color: Colors.black,
                    icon: const Icon(Icons.expand_less_sharp),
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