import 'package:flutter/material.dart';
import 'package:winhacks_2024/screens/checkin_widget.dart';
import 'package:winhacks_2024/screens/friend_list_widget.dart';
import './screens/map_widget.dart';
import './screens/login_widget.dart';

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
  bool loggedIn = true;
  String loginMessage = 'You are logged in as: miranda.ransom.0129@gmail.com';

  void login() {
    loggedIn = true;
  }

  void logout() {
    setState(() {
      loggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(98, 101, 33, 117),
        title: const Text('Unity through Third Spaces'),
        elevation: 2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (loggedIn) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(loginMessage),
                  actions: [
                    ElevatedButton(onPressed: () {
                      print('login button clicked');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginWidget()),
                      );
                    }, 
                    child: Text(loggedIn ? 'Logout' : 'Login'),
                  ),
                  ],
                  bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.location_on)),
                    Tab(icon: Icon(Icons.map)),
                    Tab(icon:Icon(Icons.face_2)),
                  ]),
                ),
                body: const TabBarView(
                  children: [
                    CheckInWidget(),
                    MapWidget(),
                    FriendsListWidget(),
                  ],
                )
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please login'),
                  TextButton(onPressed: () {
                    setState(() {
                      loggedIn = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginWidget()),
                    );
                  }, 
                  child: const Text("Login")
                  )
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
