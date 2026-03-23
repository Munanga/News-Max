import 'package:flutter/material.dart';
import 'package:newsmax/api/get_top_news.dart';
import 'package:newsmax/widgets/stateless/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String newsItemsCount = '20';
  late Future topNews;
  String selectedCategory = '';

  void filterByCategory(String category) {
    setState(() {
      topNews = getNews(newsItemsCount, category);
    });
  }

  Future _refreshNews() {
    setState(() {
      topNews = getNews(newsItemsCount, '');
    });
    return topNews;
  }

  @override
  void initState() {
    super.initState();
    topNews = getNews(newsItemsCount, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewsMax')),
      body: FutureBuilder(
        future: topNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
      
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
      
          final data = snapshot.data!;
          final articleList = data['response']['results'];
      
          return RefreshIndicator(
            onRefresh: _refreshNews,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'world';
                          filterByCategory('world');
                        },
                        child: Text(
                          'World',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'world'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'business';
                          filterByCategory('business');
                        },
                        child: Text(
                          'Business',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'business'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'technology';
                          filterByCategory('Technology');
                        },
                        child: Text(
                          'Technology',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'technology'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'sport';
                          filterByCategory('Sport');
                        },
                        child: Text(
                          'Sport',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'sport'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'culture';
                          filterByCategory('Culture');
                        },
                        child: Text(
                          'Culture',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'culture'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'environment';
                          filterByCategory('Environment');
                        },
                        child: Text(
                          'Environment',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'environment'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedCategory = 'science';
                          filterByCategory('Science');
                        },
                        child: Text(
                          'Science',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedCategory == 'science'
                                ? Colors.blueAccent
                                : Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Latest News', style: TextStyle(fontSize: 30)),
                SizedBox(height: 10),
                Expanded(
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
                          'thumbnail': item['fields']['thumbnail'],
                          'body': item['fields']['body'],
                          'byline': item['fields']['byline'],
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
