import 'package:flutter/material.dart';
import 'package:u_safe_seguranca/tabs/user_tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _page = 0;
  String _title = "";

  final List<Widget> _children = [
    MissionTab(),
    ChatTab(),
    PerfilTab(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _title = "";
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: _children[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Missão',
            icon: Icon(
              Icons.emoji_flags_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_bubble_outline),
          ),
          BottomNavigationBarItem(
            label: 'Conta',
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _page = index;
      switch (index) {
        case 0:
          {
            _title = 'Missões';
          }
          break;
        case 1:
          {
            _title = 'Chat';
          }
          break;
        case 2:
          {
            _title = 'Perfil';
          }
          break;
      }
    });
  }
}
