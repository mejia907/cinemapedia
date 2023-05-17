import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class IsarDataSource extends LocalStorageDatasource {
  late Future<Isar> db;

  //Abrir la DB
  IsarDataSource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    //Validar si la instancia ya fue generada
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;

    final Movie? isMovieFavorite =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isMovieFavorite != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final movieFavorite =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (movieFavorite != null) {
      //Eliminar
      isar.writeTxnSync(() => isar.movies.deleteSync(movieFavorite.isarId!));
    }

    //Insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
