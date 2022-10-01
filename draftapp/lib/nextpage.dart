import 'package:flutter/material.dart';
import 'home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NextPage extends StatefulWidget {

  @override
  _NextPage createState() => _NextPage();
}

class _NextPage extends State<NextPage> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Column(
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                    center: Text('90.0%', style: TextStyle(fontSize: 8),),
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
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                    center: Text('80.0%', style: TextStyle(fontSize: 8),),
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
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                    center: Text('75.0%', style: TextStyle(fontSize: 8),),
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
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                    center: Text('80.0%', style: TextStyle(fontSize: 8),),
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
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                    center: Text('80.0%', style: TextStyle(fontSize: 8),),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: calculateBackgroundColor(value: 0.8),
                    backgroundColor: Colors.grey[300],
                    animation: true,
                    animationDuration: 1500,
                  ),
                ],
              )
          ),
        ],
      ),
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

}





