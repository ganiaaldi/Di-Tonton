import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:equatable/equatable.dart';

class TvSeriesResponse extends Equatable {
  final List<TvSeriesModel> tv_seriesList;

  TvSeriesResponse({required this.tv_seriesList});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        tv_seriesList: List<TvSeriesModel>.from((json["results"] as List)
            .map((x) => TvSeriesModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tv_seriesList.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [tv_seriesList];
}
