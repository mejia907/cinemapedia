import 'package:cinemapedia/domain/entities/movie.dart';

/// Definir los origenes de datos y los metodos para traer la informacion
abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
