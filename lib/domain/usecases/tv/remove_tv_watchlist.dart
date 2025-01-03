import 'package:dartz/dartz.dart';

import 'package:ditonton/utils/failure.dart';
import '../../entities/tv_detail.dart';
import '../../repositories/tv_repository.dart';

class RemoveTvWatchlist {
  final TvRepository repository;

  RemoveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.removeWatchlist(tv);
  }
}
