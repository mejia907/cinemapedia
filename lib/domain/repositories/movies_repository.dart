import 'package:cinemapedia/domain/entities/movie.dart';

/// Permite hacer el llamado y los cambios de los Datasource
abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
