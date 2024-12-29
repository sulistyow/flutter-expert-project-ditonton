import 'package:dartz/dartz.dart';

import 'package:ditonton/utils/failure.dart';
import '../../entities/tv.dart';
import '../../repositories/tv_repository.dart';

class SearchTvs {
  final TvRepository repository;

  SearchTvs(this.repository);

  Future<Either<Failure, List<Tv>>> execute(String query) {
    return repository.searchTvs(query);
  }
}
