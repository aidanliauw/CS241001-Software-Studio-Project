class Message {
  final String text;
  final bool isMe; // Indicates if the message was sent by the user

  Message({required this.text, required this.isMe});
}