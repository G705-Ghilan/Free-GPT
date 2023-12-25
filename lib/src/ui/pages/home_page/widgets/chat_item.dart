import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat});
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        borderRadius: KTheme.borderRadius,
        color: context.wHome.chat == chat
            ? context.colorScheme.secondaryContainer
            : null,
      ),
      child: ListTile(
        title: Text(chat.title ?? "New Chat"),
        onTap: () {
          context.rHome.setChat(chat);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
        },
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: KTheme.padd),
        shape: RoundedRectangleBorder(borderRadius: KTheme.borderRadius),
        subtitle: chat.messages.length <= 1
            ? null
            : Text(
                chat.messages[1].message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
      ),
    );
  }
}
