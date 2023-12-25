import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'widgets.dart';

class Messages extends StatelessWidget {
  const Messages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.wHome.chat.messages.isEmpty) {
      return Center(
        child: GPTTextAnimation(
          texts: const ["ChatGPT"],
          looping: false,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return ListView(
      reverse: true,
      shrinkWrap: true,
      children: [
        for (MessageModel message in context.wHome.chat.messages)
          MessageItem(
            message: message,
            isLast: message == context.wHome.chat.messages.last,
          ),
        const WebBrowsing(),
      ].reversed.toList(),
    );
  }
}
