import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListCategories(),
            Expanded(
              child: ListNews(newsService.articlesByCategory),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories();

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                const SizedBox(
                  height: 5,
                ),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newService.selectedCategory == category.name)
              ? Colors.red
              : Colors.black54,
        ),
      ),
    );
  }
}
