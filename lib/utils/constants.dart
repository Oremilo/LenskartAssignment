class Constants {
  // IMPORTANT: Replace with your actual TMDB API key
  static const String apiKey = '4f82923b6a3d81194dd49e295863d30f';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String originalImageBaseUrl = 'https://image.tmdb.org/t/p/original';
  
  // Endpoints
  static const String popularMoviesEndpoint = '/movie/popular';
  static const String searchMoviesEndpoint = '/search/movie';
  static const String movieDetailsEndpoint = '/movie';
  
  // Storage Keys
  static const String favoritesKey = 'favorites';
  static const String watchlistKey = 'watchlist';
  
  // Notification
  static const String notificationChannelId = 'movie_channel';
  static const String notificationChannelName = 'Movie Notifications';
}