import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  final double size = 100.0;
  PlayPause buttonState =PlayPause.play;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController, curve: Curves.fastOutSlowIn
    ))..addListener(() {
      setState(() {

      });
    });
    
    
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Circle Animation"),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Transform.rotate(
                          angle: 3.4 * pi/ 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: 4.0,
                            height: 75.0 * animation.value,
                            color: Colors.blue,

                          ),
                          
                        ),
                        SizedBox(
                          height: 30.0 * animation.value,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 55.0 * animation.value,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Transform.rotate(
                          angle: pi,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 4.0,
                            height: 75.0 * animation.value,
                            color: Colors.blue,

                          ),
                          
                        ),
                        SizedBox(
                          height: 70.0,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 55.0 * animation.value,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        Transform.rotate(
                          angle: -3.4 * pi/ 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: 4.0,
                            height: 75.0 * animation.value,
                            color: Colors.blue,

                          ),
                          
                        ),
                        SizedBox(
                          height: 30.0 * animation.value,
                        )
                      ],
                    ),
                  ],
                )
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size - (size  * .2 * animation.value),
                      width: size - (size  * 0.2 * animation.value),
                      child: CircularButton(
                        icon: buttonState == PlayPause.play ? Icons.pause : Icons.play_arrow,
                        onPressed: () {
                          print('pressed');
                          print(animation.value);
                          if(buttonState == PlayPause.play) {
                            setState(() {
                              animationController.reverse();  
                              buttonState = PlayPause.pause;
                            });
                            
                          } else {
                            setState(() {
                              animationController.forward();
                              buttonState = PlayPause.play;  
                            });
                          } 
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: (75.0  * animation.value),
                            width: (75.0  * animation.value),
                            child: Opacity(
                              opacity: animation.value,
                              child: CircularButton(
                                icon: Icons.alarm,
                              ),
                            ),
                          ),
                          Container(
                            width: 75.0 * animation.value,
                            height: 75.0 * animation.value,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20.0 * animation.value,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: (75.0  * animation.value),
                            width: (75.0  * animation.value),
                            child: Opacity(
                              opacity: animation.value,
                              child: CircularButton(
                                icon: Icons.alarm,
                              ),
                            ),
                          ),
                          Container(
                            width: 75.0 * animation.value,
                            height: 200.0 * animation.value,
                          )
                        ],
                      ),
                      SizedBox(width: 20.0 * animation.value,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: (75.0  * animation.value),
                            width: (75.0  * animation.value),
                            child: Opacity(
                              opacity: animation.value,
                              child: CircularButton(
                                icon: Icons.alarm,
                              ),
                            ),
                          ),
                          Container(
                            width: 75.0 * animation.value,
                            height: 75.0 * animation.value,
                          )
                        ],
                      ),
                  ],
                ),
              )
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}


class CircularButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final IconData icon;
  final double size;
  CircularButton({
    Key key,
    this.child, 
    this.onPressed, 
    this.icon, 
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: new CircleBorder(),
      fillColor: Colors.blue,
      splashColor: Colors.pinkAccent,
      highlightColor: Colors.pinkAccent.withOpacity(0.5),
      elevation: 10.0,
      highlightElevation: 5.0,
      onPressed: onPressed,
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Icon(
          icon,
          color: Colors.white,
          size: 35.0,
        ),
      ),
    );
  }
}

enum PlayPause {
  play,
  pause
}