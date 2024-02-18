import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/friend.dart';

class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({super.key});

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {
   List<Friend> friendsList = [
    Friend(name: "Dora", checkedIn: true, place: "Uni of Windsor", email: "dorastrelkova@gmail.com"), 
    Friend(name: "Marissa", checkedIn: true, place: "WRG", email: "krallMarissa@gmail.com"), 
    Friend(name: "Ryan", checkedIn: false, place:"", email: "ryanprarie@gmail.com")];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Your friends list'
            ),
            Expanded(
              child: ListView.builder(
                itemCount: friendsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    title: Text("${friendsList[index].name}, ${friendsList[index].email}"),
                    subtitle: Text(friendsList[index].getLocationDisplay()),
                  );
                }
              ),
            ),
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