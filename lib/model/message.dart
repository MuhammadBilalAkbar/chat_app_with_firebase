class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime sentTime;

  const Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.sentTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      Message(
        receiverId: json['receiverId'],
        senderId: json['senderId'],
        sentTime: json['sentTime'].toDate(),
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'receiverId': receiverId,
        'senderId': senderId,
        'sentTime': sentTime,
        'content': content,
      };
}
