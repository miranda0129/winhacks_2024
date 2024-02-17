import 'package:flutter/material.dart';

class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({super.key});

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          children: [
            const Text('Your friends'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('pressed');
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
    );
    
    
     
  }
}