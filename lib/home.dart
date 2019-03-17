import 'package:flutter/material.dart';
// import 'widgets/progress_bar.dart';
import 'index_view.dart';

const List<String> INDEX_OF_LETTERS = const [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  List<Widget> _widgets = [];
  double _rowHeight = 50.0;

  // Map<String, int> _indexSectionMap = new Map();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   double offset = _scrollController.offset;
    //   print('offset = $offset');
    // });

    for (int i = 0; i < INDEX_OF_LETTERS.length; i++) {
      _widgets.add(getRow(INDEX_OF_LETTERS[i]));
    }
  }

  // _addRow() {
  //   setState(() {
  //     widgets.add(getRow(widgets.length));
  //   });
  // }

  Widget getRow(String letter) {
    return new GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, '/demo');
        },
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          // padding: EdgeInsets.all(15.0),
          height: _rowHeight,
          child: Text(letter),
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(title: Text(widget.title)),
  //       body: CustomPaint(
  //         painter: ProgressPaint(context),
  //       ));
  // }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: _widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return _widgets[position];
      },
    );
  }

  Widget _buildIndexView() {
    return Align(
      alignment: Alignment.centerRight,
      child: IndexSideBar(INDEX_OF_LETTERS, onDrag: (IndexItem item) {
        _scrollController.jumpTo(item.index *
            _rowHeight.clamp(.0, _scrollController.position.maxScrollExtent));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('render list view');
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Stack(
          children: <Widget>[_buildListView(context), _buildIndexView()],
        ));
  }
}
