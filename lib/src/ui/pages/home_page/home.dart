import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'widgets/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SystemAreas(
        systemNavigationBarColor: context.colorScheme.surface,
        child: Scaffold(
          drawer: const AppDrawer(),
          bottomNavigationBar: const MessagingField(),
          appBar: AppBar(
            title: context.wHome.chat.title == null
                ? const SizedBox()
                : GPTTextAnimation(
                    texts: [context.wHome.chat.title!],
                    looping: false,
                    isOneside: true,
                    hideOnEnd: true,
                    style: context.textTheme.titleMedium,
                  ),
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                onPressed: context.rHome.newChat,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: context.rHome.toggleTheme,
                icon: Icon(
                  context.wHome.themeMode == ThemeMode.dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: const Messages(),
        ),
      ),
    );
  }
}
