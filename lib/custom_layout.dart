import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_body.dart';

class CustomLayout extends StatefulWidget {
  @override
  _CustomLayoutState createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500),);
    _animation = Tween<Size>(begin: Size(50, double.infinity), end: Size(200, double.infinity))
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));

    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  bool _isOpen = false;
  void _expendDrawer(){
    _isOpen = !_isOpen;
    if(_isOpen){
      _animationController.forward();
    }
    else{
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //left layout
        Container(
          width: _animation.value.width,
          color: Colors.blue,
        ),
        //right layout
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //app bar
                CustomAppBar(
                  onArrowPressed: () {
                    _expendDrawer();
                  },
                ),
                //body
                CustomBody(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}




