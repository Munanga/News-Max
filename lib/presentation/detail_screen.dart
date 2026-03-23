import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:newsmax/utils/date_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> params;

  const DetailScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              params['category'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              params['title'],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              formatShortDate(params['date']),
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              width: 500,
              child: Image(
                image: NetworkImage(params['thumbnail']),
                fit: BoxFit.cover,
              ),
            ),
            Html(data: params['byline']),
            Html(
              data: params['body'],
              style: {
                "body": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                  fontSize: FontSize(17),
                  lineHeight: LineHeight(1.7),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[900],
                  fontFamily: GoogleFonts.lora().fontFamily,
                ),
                "p": Style(
                  margin: Margins.only(bottom: 20),
                  textAlign: TextAlign.justify,
                ),
                "h1": Style(
                  fontSize: FontSize(26),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(top: 24, bottom: 12),
                ),
                "h2": Style(
                  fontSize: FontSize(22),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(top: 20, bottom: 10),
                ),
                "h3": Style(
                  fontSize: FontSize(19),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(top: 16, bottom: 8),
                ),
                "strong": Style(fontWeight: FontWeight.bold),
                "em": Style(fontStyle: FontStyle.italic),
                "a": Style(
                  color: Colors.blue[700],
                  textDecoration: TextDecoration.underline,
                ),
                "blockquote": Style(
                  margin: Margins.symmetric(vertical: 16),
                  padding: HtmlPaddings.only(left: 16),
                  border: Border(
                    left: BorderSide(color: Colors.grey[400]!, width: 4),
                  ),
                  fontStyle: FontStyle.italic,
                  backgroundColor: Colors.grey[100],
                ),
                "ul": Style(margin: Margins.only(bottom: 16, left: 20)),
                "ol": Style(margin: Margins.only(bottom: 16, left: 20)),
                "li": Style(margin: Margins.only(bottom: 8)),
                "img": Style(margin: Margins.symmetric(vertical: 16)),
              },
              // Handle link taps
              onLinkTap: (url, attributes, element) {
                if (url != null) {
                  // Open URL in browser
                  // You'll need url_launcher package for this
                  print('Tapped link: $url');
                }
              },
            ),

            SizedBox(height: 15),
            Center(child: Text('By ${params['author']}')),
            Padding(padding: EdgeInsetsGeometry.only(bottom: 50)),
          ],
        ),
      ),
    );
  }
}
