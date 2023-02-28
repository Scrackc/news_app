import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/theme.dart';
import 'package:news_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headlines.isEmpty)
          ? Center(
              child: CircularProgressIndicator(
                color: myTheme.colorScheme.secondary,
              ),
            )
          : ListNews(
              newsService.headlines,
            ),
    );
  }
  
  @override
  
  bool get wantKeepAlive => true;
}
