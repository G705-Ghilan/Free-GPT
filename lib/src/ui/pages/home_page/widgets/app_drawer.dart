import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'widgets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  AuthOptions.user.photoURL!,
                ),
              ),
              title: Text(AuthOptions.user.displayName ?? "..."),
              subtitle: Text(AuthOptions.user.email ?? "...@..."),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: KTheme.padd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History",
                      style: context.textTheme.labelMedium,
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: KTheme.padd),
                        itemCount: context.wHome.chats.length,
                        itemBuilder: (context, index) {
                          return ChatItem(chat: context.rHome.chats[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
