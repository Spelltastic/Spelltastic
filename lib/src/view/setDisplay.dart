import 'package:flutter/material.dart';
import 'widgets/spellSetWidget.dart';
import 'home.dart';

class SetDisplay extends StatefulWidget {
  @override
  _SetDisplayState createState() => _SetDisplayState();
}

class _SetDisplayState extends State<SetDisplay> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const Color accentColor = Color(0xFF9C27B0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nom du set',
          style: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
          ),
        ),
        backgroundColor: accentColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _currentPage == 0
                    ? null
                    : () {
                        _goToPage(_currentPage - 1);
                      },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        _goToPage(_currentPage + 1);
                      },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  child: SpellSetWidget(
                    level: '1',
                  ),
                ),
                Container(
                  child: SpellSetWidget(
                    level: '2',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
