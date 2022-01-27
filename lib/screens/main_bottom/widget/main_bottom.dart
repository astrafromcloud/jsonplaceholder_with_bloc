import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_bloc/screens/posts/widget/post_widget.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int _initIndex = 0;

  final List<String> navBarName = ['News', 'Gallery', 'Check', 'Contacts'];

  final List navbar = [
    const PostWidget(),
    const Offstage(),
    const Offstage(),
    const Offstage()
    // color: const Color(0xFF100B21),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xFF100B21),

        appBar: AppBar(
          title: Text(navBarName[_initIndex]),
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF322C54),
                  Color(0xFF231D49),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
          ),
        ),

        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF322C54),
            Color(0xFF231D49),
          ])),
          child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: _initIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Gallery',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle),
                  label: 'Check',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Contacts',
                ),
              ],
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  _initIndex = index;
                });
              }),
        ));
  }
}
