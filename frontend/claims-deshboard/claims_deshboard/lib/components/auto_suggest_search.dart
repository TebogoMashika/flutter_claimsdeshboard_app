import 'package:flutter/material.dart';

class AutoSuggestSearch extends SearchDelegate {
  List searchTerms;

  AutoSuggestSearch(this.searchTerms);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];

        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var results = matchQuery[index];
            return ListTile(
              title: Text(results),
              onTap: () {
                close(context, results);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];

    for (var items in searchTerms) {
      if (items
          .toString()
          .toLowerCase()
          .contains(query.toString().toLowerCase())) {
        matchQuery.add(items);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return ListTile(
          title: Text('$results'),
          onTap: () {
            close(context, results);
          },
        );
      },
    );
  }
}
