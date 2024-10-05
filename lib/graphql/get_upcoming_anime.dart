import 'package:aniwatch_tv/graphql/endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetUpcomingAnime {
 static EndPoint endPoint = EndPoint();

 static  getUpcomingAnime(int page)async{
   final document = gql('''
query {
    nextSeason: Page(page: $page, perPage: 10) {
        media(sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
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
    source
    status(version: 2)
    episodes
    duration
    chapters
    volumes
    genres
    isAdult
    averageScore
    popularity
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
    staff{
        edges{
            id
        }
    }
    tags {
            name
            category
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


    return result.data!['nextSeason']['media'];

  }



}