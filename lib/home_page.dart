import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List meses = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];


  @override
  void initState(){
super.initState();
//FirebaseFirestore.instance.
//collection('expenses').
//where('month',isEqualTo: 10).
//snapshots().
//listen((data) {  })
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        child: Icon(icon),
        padding: const EdgeInsets.all(8.0),
      ),
      onTap: () {},
    );
  }

  Widget _selector() => SizedBox.fromSize(
        size: const Size.fromHeight(70),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meses.length,
          itemBuilder: (context, index) {
            return Center(
                child: Text(
              meses[index],
              style: const TextStyle(fontSize: 20),
            ));
          },
        ),
      );

  Widget _expenses() => Container(
        child: Column(
          children: const [
            Center(
              child: Text(
                '\$2300',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
              ),
            ),
            Center(
              child: Text(
                'Total Expenses',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );
  Widget _graph() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        color: Colors.red,
      );

  Widget _itemRow(IconData icon, String nombre, int porcentaje, double gasto) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
      ),
      child: Row(
        children: [
          Icon(icon),
          const Spacer(),
          Column(
            children: [Text(nombre), Text("$porcentaje \%")],
          ),
          const Spacer(
            flex: 7,
          ),
          Text(gasto.toString())
        ],
      ),
    );
  }

  Widget _list() => Expanded(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return _itemRow(Icons.abc, "Gastos", 14, 1500);
          },
        ),
      );

  Widget _body() {
    return SafeArea(
        child: SafeArea(
      child: Column(
        children: [
          _selector(),
          _expenses(),
          _graph(),
          _list(),
        ],
      ),
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
