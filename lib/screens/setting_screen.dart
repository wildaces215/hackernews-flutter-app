import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  String _email = "thinkingclearlytech@gmail.com";

  final Uri params = Uri(
    scheme: 'mailto',
    path: 'thinkingclearlytech@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Settings'),
            titleTextStyle: Theme.of(context).textTheme.headline6),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                launch("mailto:thinkingclearlytech@gmail.com");
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Y Hacker News App',
                    applicationIcon: Image.asset('assets/icons/logo.png',
                        width: 75, height: 75));
              },
            )
          ],
        ));
  }
}
