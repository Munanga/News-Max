import 'package:flutter/material.dart';
import 'package:newsmax/api/get_top_news.dart';
import 'package:newsmax/widgets/stateless/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future? newsSearch;

  void querySearch(String query) {
    setState(() {
      newsSearch = searchNews('20', query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Scaffold(
        appBar: AppBar(
          actions: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.only(left: 8, right: 8),
                child: SearchBar(
                  hintText: 'Search for news headlines, articles and more',
                  onSubmitted: (value) {
                    querySearch(value);
                  },
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: newsSearch,
          builder: (context, snapshot) {
            if (newsSearch == null){
              return Text('');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data!;
            final articleList = data['response']['results'];

            if (articleList.length == 0){
              return Center(child: Text('Sorry Could not find results matching your search :(', style: TextStyle(fontSize: 17),));
            }

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    final item = articleList[index];
                    return NewsCard(
                      params: {
                        'category': item['sectionName'],
                        'author': item['fields'] != null
                            ? item['fields']['byline'].toString()
                            : '',
                        'date': item['webPublicationDate'],
                        'title': item['webTitle'],
                        'thumbnail': item['fields'] != null ? item['fields']['thumbnail'] : '',
                        'body': item['fields']['body'],
                        'byline': item['fields']['byline'],
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
