import 'dart:developer';
import 'package:aniwatch_tv/graphql/endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetAnimeBySearch {
  static EndPoint endPoint = EndPoint();

  static getAnimeBySearch(String value)async{
    final document = gql('''
query {
    top: Page(page: 1, perPage: 50) {
        media(sort: SCORE_DESC, type: ANIME, isAdult: false, search: "$value") {
            ...media
        }
    }
}
fragment media on Media {
    id
    title {
        userPreferred
    }
    coverImage {
        extraLarge
        large
        color
    }
    startDate {
        year
        month
        day
    }
    endDate {
        year
        month
        day
    }
    bannerImage
    season
    seasonYear
    description
    type
    format
    favourites
    status(version: 2)
    episodes
    duration
    chapters
    volumes
    genres
    isAdult
    source
    averageScore
    popularity
    staff{
        edges{
            id
        }
    }
    tags {
            name
            category
        }
    mediaListEntry {
        id
        status
    }
    nextAiringEpisode {
        airingAt
        timeUntilAiring
        episode
    }
    trailer{
        site
        id
        thumbnail
    }
    studios(isMain: true) {
        edges {
            isMain
            node {
                id
                name
            }
        }
    }
}
''');
    // var query = GetQuery.getAllAnime(5);
    var client = endPoint.getClient();

    final QueryOptions options = QueryOptions(
      document: document,
    );
    final QueryResult result = await client.value.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }
    log(":::${result.data!['top']}");
    return result.data!['top']['media'];
  }

}