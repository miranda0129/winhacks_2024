import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/friend_request.dart';

class AddFriendWidget extends StatefulWidget {
  final List<FriendRequest> pendingRequests;

  const AddFriendWidget({super.key, required this.pendingRequests});

  @override
  State<AddFriendWidget> createState() => _AddFriendWidgetState();
}

class _AddFriendWidgetState extends State<AddFriendWidget> {
  final TextEditingController emailTextField = TextEditingController();

  bool alertBoxActive = false;
    void sendFriendRequest(String email) {
      //widget.pendingRequests = [...pendingRequests];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(98, 101, 33, 117),
        title: const Text('Find your next Third Place'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Add friend: "),
             SizedBox(
                    width: 200,
                    child: TextField(
                      controller: emailTextField,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'by email',
                          alignLabelWithHint: true,
                      ),
                    ),
                  ),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);

              },
              child: const Text('ADD'),
            ),
          ].map((widget) => Padding(
              padding: const EdgeInsets.all(16),
              child: widget,
              )).toList(),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Friend request sent!"),
          content: const Text('You will receive their check-ins when they accept.'),
          actions: [
            TextButton(
              onPressed: () {
                //cheeseeeeeed
                sendFriendRequest(emailTextField.text);

                // Close the alert dialog
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}