import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/presentation/pages/movie/home_movie_page.dart';
import 'package:core/presentation/pages/movie/movie_detail_page.dart';
import 'package:core/presentation/pages/movie/popular_movies_page.dart';
import 'package:core/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:core/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:core/presentation/pages/tv/popular_tvs_page.dart';
import 'package:core/presentation/pages/tv/top_rated_tvs_page.dart';
import 'package:core/presentation/pages/tv/tv_detail_page.dart';
import 'package:core/presentation/pages/tv/watchlist_tvs_page.dart';
import 'package:core/presentation/provider/Tv/popular_Tvs_bloc.dart';
import 'package:core/presentation/provider/movie/movie_detail_bloc.dart';
import 'package:core/presentation/provider/movie/movie_list_bloc.dart';
import 'package:core/presentation/provider/movie/popular_movies_bloc.dart';
import 'package:core/presentation/provider/movie/top_rated_movies_bloc.dart';
import 'package:core/presentation/provider/movie/watchlist_movie_bloc.dart';
import 'package:core/presentation/provider/tv/top_rated_tvs_bloc.dart';
import 'package:core/presentation/provider/tv/tv_detail_Bloc.dart';
import 'package:core/presentation/provider/tv/tv_list_Bloc.dart';
import 'package:core/presentation/provider/tv/watchlist_tv_bloc.dart';
import 'package:core/utils/routes.dart';
import 'package:core/utils/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/bloc/search_bloc.dart';
import 'package:search/bloc/tv_search_bloc.dart';
import 'package:search/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics.instance.logAppOpen();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          drawerTheme: kDrawerTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case POPULAR_MOVIES_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TOP_RATED_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MOVIE_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case TV_SEARCH_ROUTE:
              return CupertinoPageRoute(builder: (_) => TvSearchPage());
            case WATCHLIST_MOVIE_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case POPULAR_TV_ROUTE:
              return MaterialPageRoute(builder: (_) => PopularTvsPage());
            case TOP_RATED_TV_ROUTE:
              return MaterialPageRoute(builder: (_) => TopRatedTvsPage());
            case TV_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case WATCHLIST_TV_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistTvsPage());

            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
