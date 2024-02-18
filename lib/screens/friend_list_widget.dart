import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/friend.dart';
import 'package:winhacks_2024/screens/add_friend_widget.dart';

class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({super.key});

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {
   List<Friend> friendsList = Friend.getFriends();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your friends list',
              style: TextStyle(
                  fontSize: 24.0, // Adjust the font size
                  fontWeight: FontWeight.bold, // Make it bold
                  fontFamily: 'Roboto', // Use a specific font family if needed
                ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddFriendWidget()),
              );
          },
            tooltip: 'Add friend',
            child: const Icon(Icons.add),
          ),
    );
  }
}