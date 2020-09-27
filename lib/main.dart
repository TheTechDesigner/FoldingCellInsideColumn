import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:folding_cell_example_2/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Folding Cell with Column';

  final _key = GlobalKey<SimpleFoldingCellState>();
  final _key1 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        // color: Color(0xFFFBE0E6),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SimpleFoldingCell.create(
              key: _key,
              frontWidget: _frontWidget(_key, 'Cell 1'),
              innerWidget: _innerWidget(_key),
              onOpen: () => print('Open Cell 1'),
              onClose: () => print('Closed Cell 1'),
              cellSize: Size(MediaQuery.of(context).size.width, 148.0),
              padding: EdgeInsets.all(16.0),
              animationDuration: Duration(milliseconds: 280),
              skipAnimation: false,
              borderRadius: 12.0,
            ),
            SimpleFoldingCell.create(
              key: _key1,
              frontWidget: _frontWidget(_key1, 'Cell 2'),
              innerWidget: _innerWidget(_key1),
              onOpen: () => print('Open Cell 2'),
              onClose: () => print('Closed Cell 2'),
              cellSize: Size(MediaQuery.of(context).size.width, 148.0),
              padding: EdgeInsets.all(16.0),
              animationDuration: Duration(
                  milliseconds: 280), // you can change animation also different
              skipAnimation: true,
              borderRadius: 12.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _frontWidget(GlobalKey<SimpleFoldingCellState> key, String title) {
    return Container(
      color: Color(0xFFC41A3B),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFFFBE0E6),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => key?.currentState?.toggleFold(),
              child: Text(
                'Open',
                style: TextStyle(color: Colors.black),
              ),
              color: Color(0xFFFBE0E6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _innerWidget(GlobalKey<SimpleFoldingCellState> key) {
    return Container(
      color: Color(0xFFFBE0E6),
      // alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          //you can use text, image or any widget.
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Folding Cell Part 2',
                style: TextStyle(
                  color: Color(0xFFC41A3B),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            // child: Image(
            //   image: AssetImage(logo),
            //   height: 200.0,
            // ),
            child: Text(
              'The Tech Designer',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC41A3B),
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => key?.currentState?.toggleFold(),
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFFC41A3B),
            ),
          ),
        ],
      ),
    );
  }
}
