import 'package:example/app/modules/downloads/page/downloads_page.dart';
import 'package:example/app/modules/home/page/home_page.dart';
import 'package:example/app/modules/new_and_hot/page/new_and_hot_page.dart';
import 'package:flutter/material.dart';

enum BottomTab {
  home(title: 'Home'),
  newAndHot(title: 'New & Hot'),
  myNetflix(title: 'My Netflix');

  final String title;
  const BottomTab({required this.title});
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  BottomTab _selectedTab = BottomTab.home;
  set tab(BottomTab tab) {
    if (_selectedTab != tab) {
      _selectedTab = tab;
      setState(() {});
    }
  }

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const NewAndHotPage(),
    const DownloadsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab.index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: BottomTab.home.title,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.video_collection),
            label: BottomTab.newAndHot.title,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shop_two_sharp),
            label: BottomTab.myNetflix.title,
          ),
        ],
        currentIndex: _selectedTab.index,
        unselectedItemColor: Colors.grey,
        onTap: (i) => tab = BottomTab.values[i],
      ),
    );
  }
}
