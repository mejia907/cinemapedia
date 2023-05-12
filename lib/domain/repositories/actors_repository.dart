import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsRespository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
