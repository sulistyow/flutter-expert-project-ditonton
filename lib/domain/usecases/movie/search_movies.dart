
import 'package:dartz/dartz.dart';

import 'package:ditonton/utils/failure.dart';
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchMovies(query);
  }
}
