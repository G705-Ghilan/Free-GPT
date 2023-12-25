import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late final SharedPreferences prefs;

  static initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> addChat(ChatModel chat, int index) async {
    await prefs.setString(index.toString(), jsonEncode(chat.json));
  }

  static Future<ChatModel?> getChat(int index) async {
    final String? data = Storage.prefs.getString(index.toString());
    if (data != null) {
      return ChatModel.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<List<ChatModel>> getChats() async {
    List<ChatModel> chats = [];
    int i = 0;
    while (true) {
      ChatModel? chat = await getChat(i);
      if (chat != null) {
        chats.add(chat);
      } else {
        break;
      }
      i++;
    }
    chats.add(ChatModel.empty());
    return chats.reversed.toList();
  }

  static ThemeMode get theme => ThemeMode.values[prefs.getInt('mode') ?? 2];

  static Future<void> setTheme(ThemeMode mode) async {
    await prefs.setInt('mode', mode.index);
  }
}
