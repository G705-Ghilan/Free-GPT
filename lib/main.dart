import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:free_gpt/firebase_options.dart';
import 'package:free_gpt/free_gpt.dart';
import 'package:free_gpt/src/src.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Storage.initialize();
  // await Storage.prefs.clear();
  List<ChatModel> chats = await Storage.getChats();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SigninProvider()),
        ChangeNotifierProvider(create: (context) => HomePageProvider(chats)),
      ],
      child: const FreeGPTApp(),
    ),
  );
}
