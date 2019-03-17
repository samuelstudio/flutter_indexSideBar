import 'package:flutter/material.dart';

class IndexItem {
  int index;
  String tag;
  IndexItem({this.index, this.tag});
}

typedef void IndexBarDragUpdate(IndexItem item);

class IndexSideBar extends StatelessWidget {
  final IndexBarDragUpdate onDrag;
  final List<String> tags;

  IndexSideBar(this.tags, {@required this.onDrag});

  @override
  Widget build(BuildContext context) {
    return _IndexView(this.tags, onDrag: this.onDrag);
  }
}

class _IndexView extends StatefulWidget {
  final IndexBarDragUpdate onDrag;
  final List<String> tags;

  _IndexView(this.tags, {@required this.onDrag});

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<_IndexView> {
  List<double> _positions = new List();
  Size _itemSize;
  int _lastIndex;
  bool _isDragging;
  Color _dragDownColor;
  double _topInset;
  IndexItem _dragItem = IndexItem();

  @override
  void initState() {
    super.initState();
    _lastIndex = 0;
    _isDragging = false;
    _itemSize = Size(24, 20);
    _dragDownColor = Colors.transparent;
  }

  void _updateTopInset() {
    RenderBox box = context.findRenderObject();
    Offset offset = box.localToGlobal(Offset.zero);
    _topInset = offset.dy;
  }

  void _updatePositions() {
    _positions.clear();
    _positions.add(0);
    double tempHeight = 0;
    widget.tags?.forEach((value) {
      tempHeight = tempHeight + _itemSize.height;
      _positions.add(tempHeight);
    });
  }

  int _getIndex(double offset) {
    for (int i = 0; i < _positions.length - 1; i++) {
      double a = _positions[i];
      double b = _positions[i + 1];
      if (a <= offset && offset < b) {
        return i;
      }
    }
    return -1;
  }

  void _handleGesture(Offset position) {
    double offset = position.dy - _topInset;
    int index = _getIndex(offset);
    if (index != -1 && _lastIndex != index) {
      _lastIndex = index;
      _dragItem.index = index;
      _dragItem.tag = widget.tags[index];
      widget.onDrag(_dragItem);
    }
    setState(() {
      _isDragging = true;
    });
  }

  Widget _transform(double dx, double sx, double alpha, String text) {
    final Matrix4 transform = Matrix4.identity()
      ..translate(dx, 0)
      ..scale(sx, sx);

    return Transform(
        origin: Offset(_itemSize.width * 0.5, _itemSize.height * 0.5),
        transform: transform,
        child: Container(
            width: _itemSize.width,
            height: _itemSize.height,
            child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF666666).withOpacity(alpha))),
            )));
  }

  List<Widget> _buildLetters() {
    List<Widget> children = new List();
    double dx = 0, sx = 1.0, alpha = 1.0;
    for (int i = 0; i < widget.tags.length; i++) {
      if (_isDragging == true) {
        if (i > _lastIndex - 4 && i < _lastIndex) {
          dx = 20.0 * (_lastIndex - i) - 80.0;
          sx = 2.0 - 0.25 * (_lastIndex - i);
          alpha = (_lastIndex - i) / 10.0;
        } else if (_lastIndex == i) {
          dx = -80.0;
          sx = 2.0;
          alpha = 1.0;
        } else if (i < _lastIndex + 4 && i > _lastIndex) {
          dx = 20.0 * (i - _lastIndex) - 80.0;
          sx = 2.0 - 0.25 * (i - _lastIndex);
          alpha = (i - _lastIndex) / 10.0;
        } else {
          dx = 0;
          sx = 1.0;
          alpha = 1.0;
        }
      }

      children.add(_transform(dx, sx, alpha, widget.tags[i]));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(12);
    return GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          _dragDownColor = const Color(0xffeeeeee);
          _updateTopInset();
          _updatePositions();
          _handleGesture(details.globalPosition);
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          _handleGesture(details.globalPosition);
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            _isDragging = false;
            _dragDownColor = Colors.transparent;
          });
        },
        child: Container(
            margin: EdgeInsets.only(right: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _buildLetters(),
            ),
            decoration: BoxDecoration(
                color: _dragDownColor,
                borderRadius:
                    BorderRadius.vertical(top: radius, bottom: radius))));
  }
}
