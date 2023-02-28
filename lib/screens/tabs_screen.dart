import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _Screens(),
        bottomNavigationBar: _Nav(),
      ),
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationProvider.currentPage,
      onTap: (value) {
        navigationProvider.currentPage = value;
      },
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens();

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<_NavigationModel>(context);

    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationProvider.pageController,
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}


class _NavigationModel extends ChangeNotifier{

  int _currentPage = 0;
  final PageController _pageController = PageController();


  int get currentPage => _currentPage;

  set currentPage(int page ) {
    _currentPage = page;
    _pageController.animateToPage(page, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  } 

  PageController get pageController => _pageController;
}