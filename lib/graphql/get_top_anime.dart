import 'dart:developer';
import 'package:aniwatch_tv/graphql/endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetTopAnime {
 static EndPoint endPoint = EndPoint();

 static getTopAnime(int page)async{
   final document = gql('''
query {
    top: Page(page: $page, perPage: 10) {
        media(sort: SCORE_DESC, type: ANIME, isAdult: false) {
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
            pageInfo{
               total    
               lastPage
            }
        
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
    tags {
            name
            category
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