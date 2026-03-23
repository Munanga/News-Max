import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getNews(String pageSize, String category) async {
  try {
    String apiKey = '692a5d13-a498-4a9b-89de-ba37a08dc982';

    var url = Uri.https('content.guardianapis.com', '/search', {
      'api-key': apiKey,
      'page-size': pageSize,
      'order-by': 'newest',
      'show-fields': 'all',
    });

    if (category.isNotEmpty) {
      url = Uri.https('content.guardianapis.com', '/search', {
        'api-key': apiKey,
        'page-size': pageSize,
        'order-by': 'newest',
        'show-fields': 'all',
        'section': category.toLowerCase(),
      });
    }

    var response = await http.get(url);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    
    if (data['response']['status'] != 'ok') {
      throw data['message'];
    }

    return data;
  } catch (e) {
    throw e.toString();
  }
}


Future<Map<String, dynamic>> searchNews(String pageSize, String query) async {
  try {
    String apiKey = '692a5d13-a498-4a9b-89de-ba37a08dc982';

    var url = Uri.https('content.guardianapis.com', '/search', {
      'api-key': apiKey,
      'page-size': pageSize,
      'q': query,
      'tag-type':'keyword',
      'order-by': 'relevance',
      'show-fields': 'all',
    });


    var response = await http.get(url);
    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (data['response']['status'] != 'ok') {
      throw data['message'];
    }

    return data;
  } catch (e) {
    throw e.toString();
  }
}
