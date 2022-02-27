import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        child: Icon(icon),
        padding: const EdgeInsets.all(8.0),
      ),
      onTap: () {},
    );
  }

  Widget _selector() => Container();
  Widget _expenses() => Container();
  Widget _graph() => Container();
  Widget _list() => Container();

  Widget _body() {
    return SafeArea(
        child: Column(
      children: [
        _selector(),
        _expenses(),
        _graph(),
        _list(),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8.0,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomAction(FontAwesomeIcons.history),
              _bottomAction(FontAwesomeIcons.chartPie),
              const SizedBox(width: 32.0),
              _bottomAction(FontAwesomeIcons.wallet),
              _bottomAction(Icons.settings),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: _body());
  }
}
