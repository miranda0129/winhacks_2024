class FriendRequest{
  String email;

  FriendRequest({
    required this.email,
  });

  static List<FriendRequest> getPendingRequests() {
    return [FriendRequest(email: "Abbie@gmail.com")];
  }

  

}

