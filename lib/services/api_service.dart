import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../utils/constants.dart';

class ApiService {
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.baseUrl}${Constants.popularMoviesEndpoint}?api_key=${Constants.apiKey}&page=$page',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.baseUrl}${Constants.searchMoviesEndpoint}?api_key=${Constants.apiKey}&query=$query',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.baseUrl}${Constants.movieDetailsEndpoint}/$movieId?api_key=${Constants.apiKey}',
        ),
      );

      if (response.statusCode == 200) {
        return Movie.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}