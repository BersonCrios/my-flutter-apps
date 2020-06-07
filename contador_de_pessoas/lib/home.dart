import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _qtdOfPeoples = 0;
  String _msgnQtd = "Pode Entrar!";

  void _changeQtdOfPeoples(int delta){
    setState(() {
      _qtdOfPeoples+=delta;
      if(_qtdOfPeoples > 15){
        _msgnQtd = "Está Cheio";
      }
      else if(_qtdOfPeoples < 0){
        _msgnQtd = "Mundo Invertido?";
      }
      else{
        _msgnQtd = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bar.jpg",
          fit: BoxFit.cover,
          height: 10000,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Pessoas: $_qtdOfPeoples",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)
                    ),
                    onPressed: (){
                      _changeQtdOfPeoples(1);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)
                    ),
                    onPressed: (){
                      _changeQtdOfPeoples(-1);
                    },
                  ),
                )
              ],
            ),


            Text(
              _msgnQtd,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0
              ),
            )
          ],
        )
      ],
    );
  }
}
