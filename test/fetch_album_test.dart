import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:ios_android_example/screens/album_view.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'fetch_album_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful http response
      // when it calls the provided http.Client
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
      expect(await fetchAlbum(client), isA<Album>());
    });
    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer(
              (realInvocation) async => http.Response('Not found', 404));
      expect(fetchAlbum(client), throwsException);
    });
  });
}
