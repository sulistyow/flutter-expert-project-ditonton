
import 'package:equatable/equatable.dart';

abstract class TvSearchEvent extends Equatable {
  const TvSearchEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends TvSearchEvent{
  final String query;

  OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
