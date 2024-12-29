
import 'package:dartz/dartz.dart';

import 'package:ditonton/utils/failure.dart';
import '../../entities/tv_detail.dart';
import '../../repositories/tv_repository.dart';

class SaveTvWatchlist {
  final TvRepository repository;

  SaveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.saveWatchlist(tv);
  }
}
