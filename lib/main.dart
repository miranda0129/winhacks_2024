import 'package:flutter/material.dart';
import 'package:winhacks_2024/screens/checkin_widget.dart';
import 'package:winhacks_2024/screens/friend_list_widget.dart';
import './screens/map_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('App Title'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.map)),
                  Tab(icon:Icon(Icons.face)),
                  Tab(icon: Icon(Icons.location_on)),
                ]),
              ),
              body: const TabBarView(
                children: [
                  MapWidget(),
                  FriendsListWidget(),
                  CheckInWidget(),
                ],
              )
            ),
          );
        }
      ),
    );
  }
}
