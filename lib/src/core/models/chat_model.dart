import 'message_model.dart';

class ChatModel {
  List<MessageModel> messages;
  String? title;

  ChatModel({required this.messages, this.title});

  factory ChatModel.empty() => ChatModel(messages: []);

  factory ChatModel.fromJson(Map<String, dynamic> data) {
    return ChatModel(
      messages: (data["messages"] as List)
          .map((e) => MessageModel.fromJson(Map<String, String>.from(e)))
          .toList(),
      title: data["title"],
    );
  }

  Map<String, dynamic> get json => {
        "messages": messages.map((msg) => msg.json).toList(),
        "title": title ?? "",
      };
}
