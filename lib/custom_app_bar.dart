import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {

  final VoidCallback onArrowPressed;

  const CustomAppBar({Key key, this.onArrowPressed}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500),);
    super.initState();
  }

  bool _isArrow = false;
  void _playArrowAnimation(){
    if(_isArrow){
      _animationController.forward();
    }
    else{
      _animationController.reverse();
    }
    _isArrow = !_isArrow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow, progress: _animationController
            ),
            onPressed: (){
              _playArrowAnimation();
              widget.onArrowPressed();
            },
            color: Colors.white,
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
