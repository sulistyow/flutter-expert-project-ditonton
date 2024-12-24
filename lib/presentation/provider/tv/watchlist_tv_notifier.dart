import 'package:ditonton/common/state_enum.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/tv/get_watchlist_tvs.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTvs = <Tv>[];

  List<Tv> get watchlistTvs => _watchlistTvs;

  var _watchlistState = RequestState.Empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTvs});

  final GetWatchlistTvs getWatchlistTvs;

  Future<void> fetchWatchlistTvs() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvs.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvsData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvs = tvsData;
        notifyListeners();
      },
    );
  }
}
