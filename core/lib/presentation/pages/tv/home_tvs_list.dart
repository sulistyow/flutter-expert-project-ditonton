import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/presentation/pages/tv/popular_tvs_page.dart';
import 'package:core/presentation/pages/tv/top_rated_tvs_page.dart';
import 'package:core/presentation/pages/tv/tv_detail_page.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv.dart';
import '../../provider/Tv/Tv_list_bloc.dart';

class HomeTvsPage extends StatefulWidget {
  @override
  _HomeTvsPageState createState() => _HomeTvsPageState();
}

class _HomeTvsPageState extends State<HomeTvsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvListBloc>().add(FetchNowPlayingTvs());
    context.read<TvListBloc>().add(FetchPopularTvs());
    context.read<TvListBloc>().add(FetchTopRatedTvs());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            BlocBuilder<TvListBloc, TvListState>(
                buildWhen: (context, state) =>
                    !(state is isLoadedPopular) && !(state is isLoadedTopRated),
                builder: (context, state) {
                  if (state is isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is isLoadedNowPlaying) {
                    return TvList(state.nowPlayingTvs);
                  } else {
                    return Text('Failed');
                  }
                }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, POPULAR_TV_ROUTE),
            ),
            BlocBuilder<TvListBloc, TvListState>(
              buildWhen: (context, state) =>
                  !(state is isLoadedNowPlaying) &&
                  !(state is isLoadedTopRated),
              builder: (context, state) {
                if (state is isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is isLoadedPopular) {
                  return TvList(state.popularTvs);
                } else {
                  return Text('Failed');
                }
              },
            ),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TOP_RATED_TV_ROUTE),
            ),
            BlocBuilder<TvListBloc, TvListState>(
              buildWhen: (context, state) =>
                  !(state is isLoadedPopular) && !(state is isLoadedNowPlaying),
              builder: (context, state) {
                if (state is isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is isLoadedTopRated) {
                  return TvList(state.topRatedTvs);
                } else {
                  return Text('Failed');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tvShow;

  TvList(this.tvShow);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvShow[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TV_DETAIL_ROUTE,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvShow.length,
      ),
    );
  }
}
