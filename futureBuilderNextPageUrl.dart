import 'dart:async';
import 'package:flutter/material.dart';


class TestWidget extends StatefulWidget {

  @override
  State createState() => new _testWidgetState();
}

class _testWidgetState extends State<TestWidget> {

  String _url=null;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            flex:3,
            child: new Container (
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: new FutureBuilder(
                      future: loadData(),
                      builder:(BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<String> dataList = snapshot.data;
                          List<Widget> listViewData = new List<Widget>();

                          dataList.forEach((String stringItem){
                            listViewData.add(new Text(stringItem, style: new TextStyle(fontWeight: FontWeight.bold),));
                          });

                          return new ListView(children: listViewData);
                        } else {
                            return new CircularProgressIndicator();
                        }
                      }
                  ),
              ),
            ),
            new Expanded (
              flex:1,
              child: new Container(
                alignment: Alignment.topCenter,
                child: new RaisedButton(
                      child: new IconButton(icon: new Icon(Icons.navigate_next),
                        onPressed: ((){
                            setState((){_url="https://somedomain/asi/recipes/?page=2";});
                          }
                        )),
                )
              )
            )
          ]
        )
    );
  }

  Future<List<String>> loadData() async {

    List<String> data = new List<String>();

    // check next page data from _url

    return data;

  }
}