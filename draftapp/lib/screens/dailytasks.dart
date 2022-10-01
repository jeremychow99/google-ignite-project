import 'package:flutter/material.dart';

//TODO FOR JEREMY'S PORTION, SEPARATE INTO SEPARATE DART FILE CAN CALL CLASS FROM THERE
//TODO SAME FOR NAV BAR ROUTING
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}