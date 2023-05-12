﻿import 'package:cinemapedia/domain/entities/movie.dart';

/// Definir los origenes de datos y los metodos para traer la informacion
abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
}
