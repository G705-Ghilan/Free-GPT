import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class HomePageProvider extends ChangeNotifier {
  List<ChatModel> chats = [ChatModel.empty()];
  bool isLoading = false;
  bool animate = true;
  int chatIndex = 0;
  bool webReading = false;

  ThemeMode themeMode = Storage.theme;

  HomePageProvider(this.chats);

  Future<void> sendMessage(BuildContext context, String message) async {
    isLoading = true;

    chat.messages.add(MessageModel(message: message, isUser: true));
    webReading = GPTServerApi.containsUrls(message);
    notifyListeners();
    String prompt = await GPTServerApi.basePrompt(message, chat);
    chat.messages.add(MessageModel(message: "●", isUser: false));
    notifyListeners();

    GPTResponse response = await GPTServerApi.sendMessage(prompt);
    webReading = false;
    chat.messages.last = MessageModel(message: response.message, isUser: false);

    if (chat.title != null) {
      await Storage.addChat(chat, chats.reversed.toList().indexOf(chat));
    }
    animate = true;
    // webReading = false;
    notifyListeners();

    if (chat.messages.length >= 2 && chat.title == null) {
      await getTitle();
    }
  }

  void setAnimate(bool doIt) {
    animate = doIt;
    notifyListeners();
  }

  void setIsLoading(bool isIt) {
    isLoading = isIt;
    notifyListeners();
  }

  Future<void> getTitle() async {
    GPTResponse response = await GPTServerApi.getTitle(chat);
    if (response.status == ResponseStatus.done) {
      chat.title = response.message;
      notifyListeners();
      await Storage.addChat(chat, chats.reversed.toList().indexOf(chat));
    }
  }

  ChatModel get chat => chats[chatIndex];

  void newChat() {
    if (isLoading) return;
    if (chats.first.messages.isNotEmpty) {
      chats.insert(0, ChatModel.empty());
    }

    chatIndex = 0;

    notifyListeners();
  }

  void setChat(ChatModel chatModel) {
    if (isLoading) return;
    chatIndex = chats.indexOf(chatModel);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await Storage.setTheme(themeMode);
    notifyListeners();
  }
}
