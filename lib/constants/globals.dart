import 'dart:convert';
import 'package:dio/dio.dart';

abstract class Globals {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const imageAppendUrl = 'https://image.tmdb.org/t/p/w500';
  static const youTube = 'https://www.youtube.com/watch?v=';
  static const apiKey = '704f1bec1fd9f61cd094541f73ba301e';
  static const token =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDRmMWJlYzFmZDlmNjFjZDA5NDU0MWY3M2JhMzAxZSIsInN1YiI6IjY1YmJkOTYyYzE0NGRkMDE3Y2ZmMzFhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.81-M7CTsmSdBlDTugvz_1qW8N44LwK-R0aMC4UHL7Bc';

  static const picsumImage = 'https://picsum.photos/200/300';
  static const youTubeDummyKey = 'sFM2QBrtV0Y';

  static const oneMonth = 2592000000;
}

Future<String?> getMovieTrailerUrl(int movieId, String apiKey) async {
  final dio = Dio();
  final url =
      'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey';

  try {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.data.toString());

      // Check if the response has the 'results' key and is not empty
      if (decodedResponse.containsKey('results') &&
          (decodedResponse['results'] as List).isNotEmpty) {
        // Filter for trailers
        final trailers = (decodedResponse['results'] as List)
            .where((video) => video['type'] == 'Trailer')
            .toList();

        // If there are trailers, return the URL of the first one
        if (trailers.isNotEmpty) {
          return 'https://www.youtube.com/watch?v=${trailers.first['key']}';
        }
      }
    }

    // If no trailer is found, return null or handle as needed
    return null;
  } catch (e) {
    // Handle errors
    print('Error: $e');
    return null;
  }
}

void main() async {
  final movieId = 297762;
  final apiKey = '704f1bec1fd9f61cd094541f73ba301e';

  final trailerUrl = await getMovieTrailerUrl(movieId, apiKey);

  if (trailerUrl != null) {
    print('Trailer URL: $trailerUrl');
  } else {
    print('No trailer found.');
  }
}
