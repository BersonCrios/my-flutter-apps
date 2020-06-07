import 'dart:convert';
import 'saveData.dart';
import 'package:flutter/material.dart';
import 'readData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  final _taskController = TextEditingController();

  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  @override
  void initState() {
    super.initState();

    readData().then((data){
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo(){
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _taskController.text;
      _taskController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
     saveData(_toDoList);
    });
  }

  Future<Null> _refresh() async{
    await Future.delayed(Duration(seconds: 1));
   setState(() {
     _toDoList.sort((a,b){
       if(a["ok"] && !b["ok"]){
         return 1;
       }
       else if(!a["ok"] && b["ok"]){
         return -1;
       }
       else return 0;
     });
     saveData(_toDoList);
   });

   return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                        labelText: "Nova Tarefa",
                        labelStyle: TextStyle(
                            color: Colors.brown
                        )
                    ),
                  ),
                ),

                RaisedButton(
                  color: Colors.brown,
                  child: Text("Add"),
                  textColor: Colors.white70,
                  onPressed: _addToDo,
                )
              ],
            ),
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount:  _toDoList.length,
                  itemBuilder: buildItem
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget buildItem(context, index){
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color:  Colors.redAccent,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white70,
            ),
          ) ,
        ),
        direction: DismissDirection.startToEnd,
        child:  CheckboxListTile(
          title: Text(_toDoList[index]["title"]),
          value: _toDoList[index]["ok"],
          secondary: CircleAvatar(
            child:  Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
          ),
          onChanged: (c){
            setState(() {
              _toDoList[index]["ok"] = c;
              saveData(_toDoList);
            });
          },
        ),
        onDismissed: (direction){
         setState(() {
           _lastRemoved = Map.from(_toDoList[index]);
           _lastRemovedPos = index;
           _toDoList.removeAt(index);
           saveData(_toDoList);

           final snack = SnackBar(
             content: Text("Tarefa ${_lastRemoved["title"]} removida"),
             action:  SnackBarAction(
               label: "Desfazer",
               onPressed: (){
                 setState(() {
                   _toDoList.insert(_lastRemovedPos, _lastRemoved);
                   saveData(_toDoList);
                 });
               },
             ),
             duration: Duration(
               seconds: 2
             ),
           );
           Scaffold.of(context).removeCurrentSnackBar();
           Scaffold.of(context).showSnackBar(snack);
         });
        },
    );

  }






}