import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:core/domain/usecases/tv/get_now_playing_tvs.dart';
import 'package:core/domain/usecases/tv/get_popular_tvs.dart';
import 'package:core/domain/usecases/tv/get_top_rated_tvs.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist_status.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tvs.dart';
import 'package:core/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:core/presentation/provider/movie/movie_detail_bloc.dart';
import 'package:core/presentation/provider/movie/movie_list_bloc.dart';
import 'package:core/presentation/provider/movie/movie_search_bloc.dart';
import 'package:core/presentation/provider/movie/popular_movies_bloc.dart';
import 'package:core/presentation/provider/movie/top_rated_movies_bloc.dart';
import 'package:core/presentation/provider/movie/watchlist_movie_bloc.dart';
import 'package:core/presentation/provider/tv/now_playing_tvs_bloc.dart';
import 'package:core/presentation/provider/tv/popular_tvs_bloc.dart';
import 'package:core/presentation/provider/tv/top_rated_tvs_bloc.dart';
import 'package:core/presentation/provider/tv/tv_detail_bloc.dart';
import 'package:core/presentation/provider/tv/tv_list_bloc.dart';
import 'package:core/presentation/provider/tv/watchlist_tv_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/bloc/tv_search_bloc.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tvs.dart';

import 'injection.dart';

class BlocProvided extends StatelessWidget {
  const BlocProvided({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieListBloc(
            getNowPlayingMovies: locator<GetNowPlayingMovies>(),
            getPopularMovies: locator<GetPopularMovies>(),
            getTopRatedMovies: locator<GetTopRatedMovies>(),
          ),
        ),
        BlocProvider(
          create: (_) => PopularMoviesBloc(locator<GetPopularMovies>()),
        ),
        BlocProvider(
          create: (_) => TopRatedMoviesBloc(locator<GetTopRatedMovies>()),
        ),
        BlocProvider(
          create: (_) => MovieDetailBloc(
            getMovieDetail: locator<GetMovieDetail>(),
            getMovieRecommendations: locator<GetMovieRecommendations>(),
            getWatchListStatus: locator<GetWatchListStatus>(),
            saveWatchlist: locator<SaveWatchlist>(),
            removeWatchlist: locator<RemoveWatchlist>(),
          ),
        ),
        BlocProvider(
          create: (_) => MovieSearchBloc(locator<SearchMovies>()),
        ),
        BlocProvider(
          create: (_) => WatchlistMovieBloc(
            getWatchlistMovies: locator<GetWatchlistMovies>(),
          ),
        ),
        BlocProvider(
          create: (_) => TvListBloc(
            getNowPlayingTvs: locator<GetNowPlayingTvs>(),
            getPopularTvs: locator<GetPopularTvs>(),
            getTopRatedTvs: locator<GetTopRatedTvs>(),
          ),
        ),
        BlocProvider(
          create: (_) => PopularTvsBloc(locator<GetPopularTvs>()),
        ),
        BlocProvider(
          create: (_) => NowPlayingTvsBloc(locator<GetNowPlayingTvs>()),
        ),
        BlocProvider(
          create: (_) => TopRatedTvsBloc(locator<GetTopRatedTvs>()),
        ),
        BlocProvider(
          create: (_) => TvDetailBloc(
            getTvDetail: locator<GetTvDetail>(),
            getTvRecommendations: locator<GetTvRecommendations>(),
            getWatchListStatus: locator<GetTvWatchListStatus>(),
            saveWatchlist: locator<SaveTvWatchlist>(),
            removeWatchlist: locator<RemoveTvWatchlist>(),
          ),
        ),
        BlocProvider(
          create: (_) => TvSearchBloc(locator<SearchTvs>()),
        ),
        BlocProvider(
          create: (_) => WatchlistTvBloc(
            getWatchlistTvs: locator<GetWatchlistTvs>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
