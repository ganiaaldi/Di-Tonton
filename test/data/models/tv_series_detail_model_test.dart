import 'dart:convert';

import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvSeriesDetailModel = TvSeriesDetailModel(
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genres: [],
    homepage: 'homepage',
    id: 1,
    languages: [],
    name: 'name',
    originCountry: [],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1.0,
    voteCount: 1,
  );

  final tTvSeriesDetail = TvSeriesDetail(
    backdropPath: 'backdropPath',
    genres: [],
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    voteCount: 1,
  );

  final tTvSeriesDetailResponse = TvSeriesDetailModel(
      backdropPath: "/path.jpg",
      firstAirDate: "2017-05-02",
      genres: [GenreModel(id: 1, name: "Action")],
      homepage: "https://www.netflix.com",
      id: 1,
      languages: ["jp"],
      name: "Name",
      originCountry: ["JP"],
      originalLanguage: "jp",
      originalName: "Original",
      overview: "overview",
      popularity: 80,
      posterPath: "/path.jpg",
      status: "Returning Series",
      tagline: "Tagline",
      type: "Scripted",
      voteAverage: 1.0,
      voteCount: 615);


  test('TvSeries Detail should be a subclass of Tv series Detail entity',
      () async {
    final result = tTvSeriesDetailModel.toEntity();
    expect(result, tTvSeriesDetail);
  });

  group('TvSeries Detail fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series_detail.json'));
      // act
      final result = TvSeriesDetailModel.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesDetailResponse);
    });
  });

  group('TvSeries Detail toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = tTvSeriesDetailModel.toJson();

      final expectedJsonMap = {
        "backdrop_path": 'backdropPath',
        "first_air_date": 'firstAirDate',
        "genres": [],
        "homepage": 'homepage',
        "id": 1,
        "languages": [],
        "name": 'name',
        "origin_country": [],
        "original_language": 'originalLanguage',
        "original_name": 'originalName',
        "overview": 'overview',
        "popularity": 1.0,
        "poster_path": 'posterPath',
        "status": 'status',
        "tagline": 'tagline',
        "type": 'type',
        "vote_average": 1.0,
        "vote_count": 1,
      };

      expect(result, expectedJsonMap);
    });
  });

}
