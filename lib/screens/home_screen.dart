import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker/controller/stories_cubit.dart';
import 'package:hacker/models/story.dart';
import 'package:hacker/screens/webview_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../webservice.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top News Articles'), actions: <Widget>[
        IconButton(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'Y Hacker News App',
                  applicationIcon: Image.asset('assets/icons/logo.png',
                      width: 75, height: 75));
            },
            icon: const Icon(FontAwesomeIcons.cog))
      ]),
      // ignore: prefer_collection_literals
      body: BlocBuilder<StoriesCubit, List<Story>>(builder: (context, stories) {
        if (stories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: stories.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(stories[index].title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebviewScreen(url: stories[index].url)));
                  });
            });
      }),
    );
  }
}
