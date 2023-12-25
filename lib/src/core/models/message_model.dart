class MessageModel {
  String message;
  final bool isUser;

  MessageModel({
    required this.message,
    required this.isUser,
  });
  factory MessageModel.fromJson(Map<String, String> data) {
    return MessageModel(
      message: data.values.first,
      isUser: data.keys.first == "User",
    );
  }

  Map<String, String> get json =>
      {isUser ? 'User' : 'Assistant': message.trim()};
}
