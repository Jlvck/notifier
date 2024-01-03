import 'package:flutter/material.dart';

class ValueNotifierClass extends StatefulWidget {
  const ValueNotifierClass({super.key});

  @override
  State<ValueNotifierClass> createState() => _ValueNotifierClassState();
}

class _ValueNotifierClassState extends State<ValueNotifierClass> {
  @override
  void initState() {
    print("initState ValueNotifierClass");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies ValueNotifierClass");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    name.dispose();
    buttonTitle.dispose();
    isVisible.dispose();
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

  ValueNotifier<String?> name = ValueNotifier<String?>(null);
  ValueNotifier<String?> buttonTitle = ValueNotifier<String?>(null);
  ValueNotifier<bool> isVisible = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    //To check for building of context
    print("building valueNotifierClass context");

    return Scaffold(
      floatingActionButton:
          isVisible.syncWidgetOnValue((context, value, child) => Visibility(
                visible: value,
                child: TextButton(
                  onPressed: () {
                    isVisible.value = false;
                    name.value = null;
                    buttonTitle.value = null;
                  },
                  child: const Text("Reset"),
                ),
              )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: name,
                builder: (BuildContext context, String? value, child) {
                  return Text(
                    value ?? "Let's Get Started",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  );
                }),
            TextButton(
                onPressed: () {
                  if (buttonTitle.value == map1[keyButton]) {
                    buttonTitle.value = map2[keyButton];
                    name.value = map2[keyName];
                  } else if (buttonTitle.value == map2[keyButton]) {
                    buttonTitle.value = map1[keyButton];
                    name.value = map1[keyName];
                    isVisible.value = true;
                  } else {
                    buttonTitle.value = map1[keyButton];
                    name.value = map1[keyName];
                    isVisible.value = true;
                  }
                },
                child: buttonTitle.syncWidgetOnValue(
                    (context, value, child) => Text(value ?? "Start")))
          ],
        ),
      ),
    );
  }
}

//building listenerbuilder using extension method
extension ValueChangeListenerOnWidget<T> on ValueNotifier<T> {
  Widget syncWidgetOnValue(
    Widget Function(BuildContext context, T value, Widget? child) builder,
  ) {
    return ValueListenableBuilder<T>(valueListenable: this, builder: builder);
  }
}
