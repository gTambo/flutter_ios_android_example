import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ios_android_example/screens/switch_page.dart';
import 'dart:io' show Platform;
import '../constants/constants.dart';
import '../platform_widgets/android/elevated_button.dart';
import '../platform_widgets/iOS/button.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumExample extends StatefulWidget {
  const AlbumExample({super.key});

  @override
  State<AlbumExample> createState() => _AlbumExampleState();
}

class _AlbumExampleState extends State<AlbumExample> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Platform.isIOS
                ? IOSButton(
                    onPressed: () => nextPage(context, const SwitchPage()),
                    label: 'next')
                : AndroidElevatedButton(
                    onPressed: () => nextPage(context, const SwitchPage()),
                    label: 'next')
          ],
        ),
      ),
    );
  }
}
