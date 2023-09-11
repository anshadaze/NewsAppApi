import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/views/articleView/article_screen.dart';
import 'package:newsapp/views/categoryNews/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  const CategoryTile({super.key, this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CateogryNews(
            category: categoryName.toLowerCase(),
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, desc, Url;
  BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.Url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                blogUrl: Url,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl ?? "Not Found")),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              desc ?? "Not Found",
              style: const TextStyle(color: Color.fromARGB(123, 51, 46, 46)),
            )
          ],
        ),
      ),
    );
  }
}
