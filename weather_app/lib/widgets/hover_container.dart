import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Function() onTapDown;
  final Function() onTapUp;

  HoverContainer({required this.child, required this.onTapDown, required this.onTapUp});

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isTouched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTouched = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTouched = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTouched = false;
        });
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(10), // include width of border here
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isTouched ?  Color(0x332566A3) : Colors.transparent,
          border: Border.all(
            color: _isTouched ? Color(0xFF0044AB) : Colors.transparent, // border color
            width: 1, // border width
          ),
        ),
        child: widget.child,
      ),
    );
  }
}