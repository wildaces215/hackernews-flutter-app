import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker/controller/stories_cubit.dart';
import 'package:hacker/models/story.dart';
import 'package:hacker/screens/setting_screen.dart';
import 'package:hacker/screens/webview_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../webservice.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Top News Articles'),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                },
                icon: const Icon(FontAwesomeIcons.cog))
          ],
          titleTextStyle: Theme.of(context).textTheme.headline6),
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
