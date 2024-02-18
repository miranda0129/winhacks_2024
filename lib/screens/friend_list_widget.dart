import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/friend.dart';
import 'package:winhacks_2024/model/friend_request.dart';
import 'package:winhacks_2024/screens/add_friend_widget.dart';

class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({super.key});

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {
   List<Friend> friendsList = Friend.getFriends();
   List<FriendRequest> pendingRequests = FriendRequest.getPendingRequests();
   late List<Friend> displayList = getDisplayList();

   List<Friend> getDisplayList() {
    List<Friend> displayRequests = [];
    for (FriendRequest request in pendingRequests) {
      Friend displayRequest = Friend(name: '', checkedIn: false, place: '', placeId: -1, email: request.email, accepted: false);
      displayRequests.add(displayRequest);
    }
    return [...friendsList, ...displayRequests];
   }
  

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
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    title: Text(displayList[index].getFriendInfo()),
                    subtitle: Text(displayList[index].getLocationDisplay()),
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
                MaterialPageRoute(builder: (context) =>  AddFriendWidget(pendingRequests: pendingRequests)),
              );
          },
            tooltip: 'Add friend',
            child: const Icon(Icons.add),
          ),
    );
  }
}