import 'package:flutter/material.dart';

class SetStateClass extends StatefulWidget {
  const SetStateClass({super.key});
  @override
  State<SetStateClass> createState() => _SetStateClassState();
}

class _SetStateClassState extends State<SetStateClass> {
  @override
  void initState() {
    print("initState SetState Class");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies SetState Class");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final String keyName = "name";
  final String keyButton = "buttonTitle";
  final Map<String, String> map1 = {
    "name": "My Surname is Ogudu",
    "buttonTitle": "firstname"
  };

  final Map<String, String> map2 = {
    "name": "My First Name is Jonathan",
    "buttonTitle": "surname"
  };

  String? name;
  String? buttonTitle;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    //To check for building of context
    print("building SetState context");

    return Scaffold(
        floatingActionButton: Visibility(
          visible: isVisible,
          child: TextButton(
            onPressed: () {
              setState(() {
                isVisible = false;
                name = null;
                buttonTitle = null;
              });
            },
            child: const Text("Reset"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name ?? "Let's Get Started",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    if (buttonTitle == "firstname") {
                      setState(
                        () {
                          buttonTitle = map2[keyButton];
                          name = map2[keyName];
                        },
                      );
                    } else if (buttonTitle == "surname") {
                      setState(() {
                        buttonTitle = map1[keyButton];
                        name = map1[keyName];
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        buttonTitle = map1[keyButton];
                        name = map1[keyName];
                        isVisible = true;
                      });
                    }
                  },
                  child: Text(buttonTitle ?? "Start")),
            ],
          ),
        ));
  }
}
