import 'package:flutter/material.dart';
import 'package:free_gpt/src/core/core.dart';
import 'package:free_gpt/src/src.dart';

class MessagingField extends StatefulWidget {
  const MessagingField({super.key});

  @override
  State<MessagingField> createState() => _MessagingFieldState();
}

class _MessagingFieldState extends State<MessagingField> {
  TextEditingController controller = TextEditingController();
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
   
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      padding: KTheme.padding.copyWith(
        // keyboard padding ...
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 6,
              minLines: 1,
              controller: controller,
              onChanged: (String? text) {
                if (controller.text.isEmpty && isReady) {
                  setState(() => isReady = false);
                  return;
                }
                if (controller.text.isNotEmpty && !isReady) {
                  setState(() => isReady = true);
                  return;
                }
              },
              decoration: InputDecoration(
                hintText: "Message",
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: KTheme.borderRadius * 1.8,
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
          ),
          SizedBox(width: KTheme.padd),
          IconButton.filled(
            onPressed: isReady && !context.wHome.isLoading ? send : null,
            icon: const Icon(Icons.arrow_upward_outlined),
          )
        ],
      ),
    );
  }

  Future<void> send() async {
    final String message = controller.text;
    setState(() {
      controller.text = "";
      isReady = false;
    });
    FocusScope.of(context).unfocus();

    await context.rHome.sendMessage(context, message);
  }
}
