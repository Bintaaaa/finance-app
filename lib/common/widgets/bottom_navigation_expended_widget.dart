import 'package:flutter/material.dart';

class BottomNavigationExpandedWidget extends StatefulWidget {
  final Widget child;
  const BottomNavigationExpandedWidget({super.key, required this.child});

  @override
  State<BottomNavigationExpandedWidget> createState() => _BottomNavigationExpandedWidgetState();
}

class _BottomNavigationExpandedWidgetState extends State<BottomNavigationExpandedWidget> {
  final double minHeight = 90;
  final double maxHeight = 270;
  Offset offset = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    offset = Offset(0, minHeight);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (position) {
        offset = Offset(0, offset.dy - position.delta.dy);
        if (offset.dy < minHeight) {
          offset = Offset(0, minHeight);
        } else if (offset.dy > maxHeight) {
          offset = Offset(0, maxHeight);
        }
        setState(() {});
      },
      child: SizedBox(
        height: offset.dy + 12,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: offset.dy,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 24.0,
                ),
                child: widget.child,
              ),
            ),
            Positioned(
              bottom: offset.dy - 10,
              child: InkWell(
                onTap: _onTap,
                splashColor: Colors.transparent,
                child: Container(
                  height: 20,
                  width: 42,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                    border: Border(
                      top: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: _iconExpanded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isExpanded => offset.dy == maxHeight;

  Offset get offsetWhenOpened => offset = Offset(0, maxHeight);
  Offset get offsetWhenClosed => offset = Offset(0, minHeight);

  Widget get _iconExpanded => _isExpanded
      ? const Icon(
          Icons.keyboard_arrow_down_rounded,
        )
      : const Icon(
          Icons.keyboard_arrow_up_rounded,
        );
  _onTap() {
    final isExpanded = _isExpanded;
    isExpanded ? offsetWhenClosed : offsetWhenOpened;
    setState(() {});
  }
}
