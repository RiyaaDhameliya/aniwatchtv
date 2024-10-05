import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EndPoint {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(
          "https://graphql.anilist.co",
          defaultHeaders: {},
        ),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return client;
  }
}
