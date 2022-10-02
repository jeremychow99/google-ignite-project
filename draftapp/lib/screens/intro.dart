import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'question.dart';

class IntroScreen extends StatelessWidget {
  final controller = PageController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
              controller: controller,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/scene1.jpg'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50,100,50,0),

                      child: const Text("Welcome! This will be your polar bear's home :)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),

                        textAlign: TextAlign.center,
                      ),
                    )

                  ],

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/scene2.jpg'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50,100,50,0),
                      child: const Text("Don't let your polar bear suffer in this poor condition :(",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )

                  ],

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/scene1.jpg'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(50,100,50,0),
                      child: const Text("Your polar bear will be healthy if you take care of him!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )

                  ],

                ),
              ]
          ),
        ),
        bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child:
                    TextButton(
                        child: const Text('Next'),
                        onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                    ),
                  ),

                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                            spacing: 16,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.teal.shade700
                        )
                    ),
                  ),
                  Padding (
                    padding: const EdgeInsets.all(15),
                    child: TextButton(
                      child: const Text('Skip'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Questionnaire()),
                        );
                      },
                    ),
                  )
                ]
            )
        ),
      );
}