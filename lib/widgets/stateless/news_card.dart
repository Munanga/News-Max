import 'package:flutter/material.dart';
import 'package:newsmax/presentation/detail_screen.dart';
import 'package:newsmax/utils/date_utils.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> params;

  const NewsCard({super.key, required this.params});
  
  @override
  Widget build(BuildContext context) {
    final thumbnail = params['thumbnail'];

    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailScreen(params: params);
              },
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: thumbnail == null ? Image.asset('assets/missingNews.png') : Image(image: NetworkImage(thumbnail)),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(params['category'], style: TextStyle(color: Colors.red)),
                  Text(
                    params['title'],
                    style: TextStyle(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    params['author'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(formatShortDate(params['date'])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
