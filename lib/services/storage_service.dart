import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';
import '../utils/constants.dart';

class StorageService {
  // Favorites
  Future<void> addToFavorites(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    if (!favorites.any((m) => m.id == movie.id)) {
      favorites.add(movie);
      final jsonList = favorites.map((m) => m.toJson()).toList();
      await prefs.setString(Constants.favoritesKey, json.encode(jsonList));
    }
  }

  Future<void> removeFromFavorites(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    favorites.removeWhere((m) => m.id == movieId);
    final jsonList = favorites.map((m) => m.toJson()).toList();
    await prefs.setString(Constants.favoritesKey, json.encode(jsonList));
  }

  Future<List<Movie>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(Constants.favoritesKey);
    
    if (jsonString == null) return [];
    
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }

  Future<bool> isFavorite(int movieId) async {
    final favorites = await getFavorites();
    return favorites.any((m) => m.id == movieId);
  }

  // Watchlist
  Future<void> addToWatchlist(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    final watchlist = await getWatchlist();
    
    if (!watchlist.any((m) => m.id == movie.id)) {
      watchlist.add(movie);
      final jsonList = watchlist.map((m) => m.toJson()).toList();
      await prefs.setString(Constants.watchlistKey, json.encode(jsonList));
    }
  }

  Future<void> removeFromWatchlist(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final watchlist = await getWatchlist();
    
    watchlist.removeWhere((m) => m.id == movieId);
    final jsonList = watchlist.map((m) => m.toJson()).toList();
    await prefs.setString(Constants.watchlistKey, json.encode(jsonList));
  }

  Future<List<Movie>> getWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(Constants.watchlistKey);
    
    if (jsonString == null) return [];
    
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }

  Future<bool> isInWatchlist(int movieId) async {
    final watchlist = await getWatchlist();
    return watchlist.any((m) => m.id == movieId);
  }
}