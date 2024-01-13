import 'package:flutter/material.dart';
import './value_notifier.dart';
// import './setState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Notifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.redAccent,
          primaryTextTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      home: const MyHomePage(title: 'Value Notifier'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("building main context");
    return const Scaffold(
      // change body property to either SetStateClass() or ValueNotifierClass()
      //to implement setState case study or ValueNotifier case study
      // & appropriate import statement for the interested case study class
      body: ValueNotifierClass(),
    );
  }
}

//building listenerbuilder using extension method
